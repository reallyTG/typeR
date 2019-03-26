library(eyetrackingR)


### Name: trackloss_analysis
### Title: Analyze trackloss.
### Aliases: trackloss_analysis

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

tl_analysis <- trackloss_analysis(data)




