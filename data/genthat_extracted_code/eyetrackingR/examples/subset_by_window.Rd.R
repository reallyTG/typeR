library(eyetrackingR)


### Name: subset_by_window
### Title: Extract a subset of the dataset within a time-window in each
###   trial.
### Aliases: subset_by_window

### ** Examples

data("word_recognition")
data <- make_eyetrackingr_data(word_recognition, 
                               participant_column = "ParticipantName",
                               trial_column = "Trial",
                               time_column = "TimeFromTrialOnset",
                               trackloss_column = "TrackLoss",
                               aoi_columns = c('Animate','Inanimate'),
                               treat_non_aoi_looks_as_missing = TRUE
)

# zoom in to 15500-21000ms
response_window <- subset_by_window(data,
                                    window_start_time = 15500,
                                    window_end_time = 21000, rezero = FALSE, remove = TRUE)

# zoom in to 15500-21000ms and re-zero so timestamps start at 0
response_window <- subset_by_window(data,
                                    window_start_time = 15500, 
                                    window_end_time = 21000, 
                                    rezero = TRUE, 
                                    remove = TRUE)

# keep all data, but re-zero it
response_window <- subset_by_window(data,
                                    window_start_time = 0, 
                                    rezero = TRUE, 
                                    remove = FALSE)




