library(fuzzySim)


### Name: timer
### Title: Timer
### Aliases: timer

### ** Examples

# get starting time:
start <- Sys.time()

# do some random analysis:
sapply(rnorm(50000), function(x) x*5)

# see how long it took:
timer(start)



