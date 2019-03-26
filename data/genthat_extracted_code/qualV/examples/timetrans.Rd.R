library(qualV)


### Name: timetrans
### Title: Bijective Transformations of Time
### Aliases: transBeta transSimplex transBezier
### Keywords: misc

### ** Examples

t <- seq(0, 1, length.out = 101)
par(mfrow = c(3, 3))
plot(t, transBeta(t, c(0, 0)), type = "l")
plot(t, transBeta(t, c(0, 1)), type = "l")
plot(t, transBeta(t, c(-1,1)), type = "l")
plot(t, transSimplex(t, c(0)), type = "l")
plot(t, transSimplex(t, c(3, 2, 1)), type = "l")
plot(t, transSimplex(t, c(0, 2)), type = "l")
plot(t, transBezier(t, c(0, 1)), type = "l")
plot(t, transBezier(t, c(0, 1, 1, 0)), type = "l")
plot(t, transBezier(t, c(0.4, 0.6)), type = "l")



