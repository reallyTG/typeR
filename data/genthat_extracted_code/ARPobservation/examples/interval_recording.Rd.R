library(ARPobservation)


### Name: interval_recording
### Title: Applies interval recording to a behavior stream
### Aliases: interval_recording

### ** Examples

BS <- r_behavior_stream(n = 5, mu = 3, lambda = 10,
                       F_event = F_exp(), F_interim = F_exp(), stream_length = 100)
interval_recording(BS, interval_length = 20, partial = TRUE, summarize = FALSE)
interval_recording(BS, interval_length = 20, partial = TRUE, summarize = TRUE)
colMeans(interval_recording(BS, 20, partial = TRUE, summarize = FALSE))
interval_recording(BS, interval_length = 20, rest_length = 5, partial = FALSE)



