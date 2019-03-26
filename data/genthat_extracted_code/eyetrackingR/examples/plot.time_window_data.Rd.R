library(eyetrackingR)


### Name: plot.time_window_data
### Title: Plot a time-window dataset
### Aliases: plot.time_window_data

### ** Examples

data(word_recognition)
data <- make_eyetrackingr_data(word_recognition, 
                               participant_column = "ParticipantName",
                               trial_column = "Trial",
                               time_column = "TimeFromTrialOnset",
                               trackloss_column = "TrackLoss",
                               aoi_columns = c('Animate','Inanimate'),
                               treat_non_aoi_looks_as_missing = TRUE)
response_window_agg_by_sub <- make_time_window_data(data, 
                                                    aois='Animate',
                                                    predictor_columns=c('Age','MCDI_Total'))
                                                    
plot(response_window_agg_by_sub, predictor_columns="Age", dv = "LogitAdjusted") 




