library(eyetrackingR)


### Name: make_switch_data
### Title: Summarize data into time-to-switch from initial AOI.
### Aliases: make_switch_data make_switch_data.onset_data

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
onsets <- make_onset_data(inanimate_trials, onset_time = 15500, 
                          fixation_window_length = 100, target_aoi='Inanimate')
                          
df_switch <- make_switch_data(onsets, predictor_columns = "MCDI_Total", 
             summarize_by = "ParticipantName")
plot(df_switch, "MCDI_Total")
                          



