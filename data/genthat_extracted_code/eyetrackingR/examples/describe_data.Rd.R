library(eyetrackingR)


### Name: describe_data
### Title: Describe dataset
### Aliases: describe_data

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
describe_data(data, describe_column = "Animate", group_columns = "ParticipantName")
 



