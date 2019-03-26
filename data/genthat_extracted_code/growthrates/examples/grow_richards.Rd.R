library(growthrates)


### Name: grow_richards
### Title: Growth Model According to Richards
### Aliases: grow_richards

### ** Examples


time <- seq(0, 30, length=200)
y    <- grow_richards(time, c(y0=1, mumax=.5, K=10, beta=2))[,"y"]
plot(time, y, type="l")
y    <- grow_richards(time, c(y0=1, mumax=.5, K=10, beta=100))[,"y"]
lines(time, y, col="red")
y    <- grow_richards(time, c(y0=1, mumax=.5, K=10, beta=.2))[,"y"]
lines(time, y, col="blue")




