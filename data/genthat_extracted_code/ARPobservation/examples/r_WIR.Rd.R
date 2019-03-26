library(ARPobservation)


### Name: r_WIR
### Title: Generates random whole interval recording behavior streams
### Aliases: r_WIR

### ** Examples

# An unsummarized set of WIR observations
r_WIR(n = 5, mu = 2, lambda = 4, stream_length = 20,
       F_event = F_exp(), F_interim = F_exp(),
       interval_length = 1, rest_length = 0)

# A summarized set of of WIR observations
r_WIR(n = 5, mu = 2, lambda = 4, stream_length = 20,
       F_event = F_exp(), F_interim = F_exp(),
       interval_length = 1, rest_length = 0,
       summarize = TRUE)



