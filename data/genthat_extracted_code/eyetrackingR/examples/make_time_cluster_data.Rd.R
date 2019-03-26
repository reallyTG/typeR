library(eyetrackingR)


### Name: make_time_cluster_data
### Title: Make data for cluster analysis.
### Aliases: make_time_cluster_data
###   make_time_cluster_data.time_sequence_data

### ** Examples

data(word_recognition)
data <- make_eyetrackingr_data(word_recognition, 
                               participant_column = "ParticipantName",
                               trial_column = "Trial",
                               time_column = "TimeFromTrialOnset",
                               trackloss_column = "TrackLoss",
                               aoi_columns = c('Animate','Inanimate'),
                               treat_non_aoi_looks_as_missing = TRUE )
response_window <- subset_by_window(data, window_start_time = 15500, window_end_time = 21000, 
                                    rezero = FALSE)

# identify clusters in the sequence data using a t-test with
# threshold t-value of 2

# (note: t-tests require a summarized dataset)
response_time <- make_time_sequence_data(response_window, time_bin_size = 500, aois = "Animate", 
                                         predictor_columns = "Sex",
                                         summarize_by = "ParticipantName")
                                         
time_cluster_data <- make_time_cluster_data(data = response_time,
                                            predictor_column = "Sex",
                                            aoi = "Animate",
                                            test = "t.test",
                                            threshold = 2
)

# identify clusters in the sequence data using an lmer() random-effects
# model with a threshold t-value of 1.5.

# random-effects models don't require us to summarize
response_time <- make_time_sequence_data(response_window, time_bin_size = 500, aois = "Animate", 
                                         predictor_columns = "Sex")
   
# but they do require a formula to be specified
time_cluster_data <- make_time_cluster_data(data = response_time,
                           predictor_column = "SexM",
                           aoi = "Animate",
                           test = "lmer",
                           threshold = 1.5,
                           formula = LogitAdjusted ~ Sex + (1|Trial) + (1|ParticipantName)
)
  



