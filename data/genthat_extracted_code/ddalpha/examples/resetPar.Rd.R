library(ddalpha)


### Name: resetPar
### Title: Reset Graphical Parameters
### Aliases: resetPar
### Keywords: visualization

### ** Examples


par(mfrow = c(1,2), mar = c(2,2,2,2))
plot(sin, -pi, 2*pi)
plot(cos, -pi, 2*pi)

par(resetPar())
plot(sin, -pi, 2*pi)
plot(cos, -pi, 2*pi)




