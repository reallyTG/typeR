library(ARPobservation)


### Name: continuous_duration_recording
### Title: Applies continuous duration recording to a behavior stream
### Aliases: continuous_duration_recording

### ** Examples

BS <- r_behavior_stream(n = 5, mu = 3, lambda = 10,
                       F_event = F_exp(), F_interim = F_exp(), stream_length = 100)
continuous_duration_recording(BS)



