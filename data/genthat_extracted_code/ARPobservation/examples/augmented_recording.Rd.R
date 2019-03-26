library(ARPobservation)


### Name: augmented_recording
### Title: Applies augmented interval recording to a behavior stream
### Aliases: augmented_recording

### ** Examples

BS <- r_behavior_stream(n = 5, mu = 3, lambda = 10,
                       F_event = F_exp(), F_interim = F_exp(), stream_length = 100)
augmented_recording(BS, interval_length = 20)



