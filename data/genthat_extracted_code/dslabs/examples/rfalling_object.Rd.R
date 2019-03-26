library(dslabs)


### Name: rfalling_object
### Title: Simulate falling object data
### Aliases: rfalling_object

### ** Examples


dat <- rfalling_object()
with(dat, plot(time, observed_distance))
with(dat, lines(time, distance, col = "blue"))




