library(eyetrackingR)


### Name: make_eyetrackingr_data
### Title: Convert raw data for use in eyetrackingR
### Aliases: make_eyetrackingr_data

### ** Examples

data(word_recognition)
data <- make_eyetrackingr_data(word_recognition, 
                               participant_column = "ParticipantName",
                               trial_column = "Trial",
                               time_column = "TimeFromTrialOnset",
                               trackloss_column = "TrackLoss",
                               aoi_columns = c('Animate','Inanimate'),
                               treat_non_aoi_looks_as_missing = TRUE
)
  



