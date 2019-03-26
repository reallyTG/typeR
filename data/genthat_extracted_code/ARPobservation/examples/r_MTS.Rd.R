library(ARPobservation)


### Name: r_MTS
### Title: Generates random momentary time sampling behavior streams
### Aliases: r_MTS

### ** Examples

# A set of unsummarized MTS observations
r_MTS(n = 5, mu = 2, lambda = 4, stream_length = 20,
       F_event = F_exp(), F_interim = F_exp(), interval_length = 1)

# A set of summarized MTS observations
r_MTS(n = 5, mu = 2, lambda = 4, stream_length = 20,
       F_event = F_exp(), F_interim = F_exp(),
       interval_length = 1, summarize = TRUE)



