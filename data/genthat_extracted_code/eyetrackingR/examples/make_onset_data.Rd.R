library(eyetrackingR)


### Name: make_onset_data
### Title: Make onset-contingent data.
### Aliases: make_onset_data

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
response_window <- subset_by_window(data, window_start_time = 15500, window_end_time = 21000, 
                                    rezero = FALSE)
inanimate_trials <- subset(response_window, grepl('(Spoon|Bottle)', Trial))
onsets <- make_onset_data(inanimate_trials, onset_time = 15500, target_aoi='Inanimate')




