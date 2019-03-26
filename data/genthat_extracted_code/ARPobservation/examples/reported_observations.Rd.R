library(ARPobservation)


### Name: reported_observations
### Title: Applies multiple recording procedures to a behavior stream
### Aliases: reported_observations

### ** Examples

BS <- r_behavior_stream(n = 50, mu = 3, lambda = 10,
                       F_event = F_exp(), F_interim = F_exp(), stream_length = 100)
reported_observations(BS, interval_length = 10)
reported_observations(BS, interval_length = 10, n_aggregate = 5)



