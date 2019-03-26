library(growthrates)


### Name: grow_logistic
### Title: Logistic Growth Model
### Aliases: grow_logistic

### ** Examples


time <- seq(0, 30, length=200)
y    <- grow_logistic(time, c(y0=1, mumax=0.5, K=10))[,"y"]
plot(time, y, type="l")




