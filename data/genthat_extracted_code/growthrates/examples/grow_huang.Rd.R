library(growthrates)


### Name: grow_huang
### Title: Growth Model According to Huang
### Aliases: grow_huang

### ** Examples


time <- seq(0, 30, length=200)
y    <- grow_huang(time, c(y0=0.01, mumax=.1, K=0.1, alpha=1.5, lambda=3))[,"y"]
plot(time, y, type="l")
plot(time, y, type="l", log="y")




