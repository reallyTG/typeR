library(ARPobservation)


### Name: event_counting
### Title: Applies event counting to a behavior stream
### Aliases: event_counting

### ** Examples

BS <- r_behavior_stream(n = 5, mu = 3, lambda = 10,
                       F_event = F_exp(), F_interim = F_exp(), stream_length = 100)
event_counting(BS)



