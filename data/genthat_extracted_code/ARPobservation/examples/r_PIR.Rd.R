library(ARPobservation)


### Name: r_PIR
### Title: Generates random partial interval recording behavior streams
### Aliases: r_PIR

### ** Examples

# An unsummarized set of PIR observations
r_PIR(n = 5, mu = 2, lambda = 4, stream_length = 20,
       F_event = F_exp(), F_interim = F_exp(),
       interval_length = 1, rest_length = 0)

# A summarized set of of PIR observations
r_PIR(n = 5, mu = 2, lambda = 4, stream_length = 20,
       F_event = F_exp(), F_interim = F_exp(),
       interval_length = 1, rest_length = 0,
       summarize = TRUE)



