library(growthrates)


### Name: grow_exponential
### Title: Exponential Growth Model
### Aliases: grow_exponential

### ** Examples


time <- seq(0, 30, length=200)
y <- grow_exponential(time, c(y0=1, mumax=0.5))[,"y"]
plot(time, y, type="l")




