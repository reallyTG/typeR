library(growthrates)


### Name: grow_baranyi
### Title: The Baranyi and Roberts Growth Model
### Aliases: grow_baranyi

### ** Examples


time <- seq(0, 30, length=200)
y    <- grow_baranyi(time, c(y0=0.01, mumax=.5, K=0.1, h0=5))[,"y"]
plot(time, y, type="l")
plot(time, y, type="l", log="y")




