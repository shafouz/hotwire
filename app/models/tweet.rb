class Tweet < ApplicationRecord
  validates :body, presence: true

  after_create_commit { broadcast_append_to 'tweets' }
  after_update_commit { broadcast_replace_to 'tweets' }
  after_destroy_commit { broadcast_remove_to 'tweets' }
end
