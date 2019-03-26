library(eyetrackingR)


### Name: make_time_sequence_data
### Title: make_time_sequence_data()
### Aliases: make_time_sequence_data

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

# bin data in 250ms bins, and generate a dataframe
# with a single AOI (Animate) predicted by Sex, and summarized by ParticipantName
response_time <- make_time_sequence_data(data,
                                         time_bin_size = 250,
                                         predictor_columns = c("Sex"),
                                         aois = "Animate",
                                         summarize_by = "ParticipantName"
)

# optionally specify other columns in the data
# to be included in the generated dataframe
# (e.g., for use in statistical models)
# bin data in 250ms bins, and generate a dataframe
# with Animate and MCDI_Total summarized by ParticipantName
response_time <- make_time_sequence_data(data,
                                         time_bin_size = 250,
                                         predictor_columns = c("Sex","MCDI_Total"),
                                         aois = "Animate", 
                                         summarize_by = "ParticipantName"
)




