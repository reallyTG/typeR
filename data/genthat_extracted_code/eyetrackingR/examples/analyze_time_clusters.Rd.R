library(eyetrackingR)


### Name: analyze_time_clusters
### Title: Bootstrap analysis of time-clusters.
### Aliases: analyze_time_clusters analyze_time_clusters.time_cluster_data

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
response_time <- make_time_sequence_data(response_window, time_bin_size = 500, aois = "Animate", 
                                         predictor_columns = "Sex")

time_cluster_data <- make_time_cluster_data(data = response_time, predictor_column = "SexM", 
                         aoi = "Animate", test = "lmer", 
                         threshold = 1.5, 
                         formula = LogitAdjusted ~ Sex + (1|Trial) + (1|ParticipantName))
summary(time_cluster_data)
plot(time_cluster_data)

# analyze time clusters in a non-parametric analysis
## Not run: 
##D tc_analysis <- analyze_time_clusters(time_cluster_data, within_subj = FALSE,
##D                                      samples = 2000)
##D plot(tc_analysis)
##D summary(tc_analysis)
## End(Not run)
  



