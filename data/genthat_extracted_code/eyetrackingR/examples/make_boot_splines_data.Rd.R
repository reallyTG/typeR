library(eyetrackingR)


### Name: make_boot_splines_data
### Title: Bootstrap resample splines for time-series data.
### Aliases: make_boot_splines_data
###   make_boot_splines_data.time_sequence_data

### ** Examples

data(word_recognition)
data <- make_eyetrackingr_data(word_recognition, 
                               participant_column = "ParticipantName",
                               trial_column = "Trial",
                               time_column = "TimeFromTrialOnset",
                               trackloss_column = "TrackLoss",
                               aoi_columns = c('Animate','Inanimate'),
                               treat_non_aoi_looks_as_missing = TRUE )
response_window <- subset_by_window(data, window_start_time = 15500, 
                                    window_end_time = 21000, rezero = FALSE)
response_time <- make_time_sequence_data(response_window, time_bin_size = 500, aois = "Animate", 
                                         predictor_columns = "Sex", 
                                         summarize_by = "ParticipantName")
                                         
df_bootstrapped <- make_boot_splines_data(response_time, 
                                          predictor_column = 'Sex', 
                                          within_subj = FALSE, 
                                          bs_samples = 500, 
                                          alpha = .05,
                                          smoother = "smooth.spline") 





