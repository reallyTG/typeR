library(eyetrackingR)


### Name: make_time_window_data
### Title: Make a dataset collapsing over a time-window
### Aliases: make_time_window_data

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

# generate a dataset summarizing an AOI (Animate) by ParticipantName
response_window_agg_by_sub <- make_time_window_data(data,
                                                    aois='Animate',
                                                    summarize_by = "ParticipantName"
)

# optionally included additional columns for use as predictors
# in later statistical models
response_window_agg_by_sub <- make_time_window_data(data,
                                                    aois='Animate',
                                                    predictor_columns=c('Age','MCDI_Total'),
                                                    summarize_by = "ParticipantName"
)

# plot the aggregated data for sanity check
plot(response_window_agg_by_sub, predictor_columns="Age", dv = "LogitAdjusted") 




