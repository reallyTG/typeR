library(eyetrackingR)


### Name: clean_by_trackloss
### Title: Clean data by removing high-trackloss trials/subjects.
### Aliases: clean_by_trackloss

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

# scrub all trials with greater than 25% trackloss, and all
# participants with greater than 25% trackloss on average
# during the timeperiod 15500-2100
data_clean <- clean_by_trackloss(data,
                                 participant_prop_thresh = .25, 
                                 trial_prop_thresh = .25,
                                 window_start_time = 15500, 
                                 window_end_time = 21000
)

# scrub all trials with greater than 25% trackloss, but leave participants with a high average
data_clean <- clean_by_trackloss(data,
                                 trial_prop_thresh = .25,
                                 window_start_time = 15500, 
                                 window_end_time = 21000
)
  



