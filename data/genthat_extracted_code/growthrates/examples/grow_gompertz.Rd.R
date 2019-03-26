library(growthrates)


### Name: grow_gompertz
### Title: Growth Model According to Gompertz
### Aliases: grow_gompertz

### ** Examples


time <- seq(0, 30, length=200)
y    <- grow_gompertz(time, c(y0=1, mumax=.2, K=10))[,"y"]
plot(time, y, type="l", ylim=c(0, 20))





