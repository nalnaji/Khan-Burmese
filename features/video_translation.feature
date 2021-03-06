Feature: Assign and complete translations.

  As a user
  So that I can help educate Burmese children
  I want to claim videos to translate.

Background:
  Given the following videos:
    | title    | description    | youtube_id  | duration |
    | The Help | A great movie. | J_ajv_6pUnI | 300      |
  And I am logged in
  And I am on the video page for "The Help"

Scenario: Assign video and unassign video.
  Then I should see "The Help"
  And I should see "Assign to Me"
  And I should see "No translations yet."
  When I press "Assign to Me"
  Then I should see "Unassign Me"
  And I should see "Translate on Amara"
  And I should see "Translate Offline"
  When I press "Unassign Me"
  Then I should see "Are you sure"
  When I press "Unassign"
  Then I should not see "Translate on Amara"

Scenario: Translate a video offline.
  When I press "Assign to Me"
  And I press "Translate Offline"
  Then I should see "If you want to translate offline"
  When I upload the file "subtitle.srt" to "srt"
  And I press "Upload"
  Then I should not see "Unassign Me"
  And I should not see "No translations yet."

Scenario: Translate a video with faulty files.
  When I press "Assign to Me"
  And I press "Translate Offline"
  And I press "Upload"
  Then I should see "Missing file."
  When I upload the file "non_srt.txt" to "srt"
  And I press "Upload"
  Then I should see "Invalid file type."
