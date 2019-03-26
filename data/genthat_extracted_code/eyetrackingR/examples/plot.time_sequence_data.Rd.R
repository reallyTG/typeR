library(eyetrackingR)


### Name: plot.time_sequence_data
### Title: Plot time-sequence data
### Aliases: plot.time_sequence_data

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
response_time <- make_time_sequence_data(data, time_bin_size = 250, 
                                         predictor_columns = c("MCDI_Total"),
                                         aois = "Animate", summarize_by = "ParticipantName")

# visualize time results
plot(response_time, predictor_column = "MCDI_Total") 





