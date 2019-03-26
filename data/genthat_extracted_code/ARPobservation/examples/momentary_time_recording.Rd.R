library(ARPobservation)


### Name: momentary_time_recording
### Title: Applies momentary time recording to a behavior stream
### Aliases: momentary_time_recording

### ** Examples

BS <- r_behavior_stream(n = 5, mu = 3, lambda = 10,
                       F_event = F_exp(), F_interim = F_exp(), stream_length = 100)
momentary_time_recording(BS, interval_length = 20, FALSE)
momentary_time_recording(BS, interval_length = 20)
colMeans(momentary_time_recording(BS, 20, FALSE)[-1,])



