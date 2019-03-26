library(oce)


### Name: window.oce
### Title: Window an Oce Object by Time or Distance
### Aliases: window.oce

### ** Examples

library(oce)
data(adp)
plot(adp)
early <- window(adp, start="2008-06-26 00:00:00", end="2008-06-26 12:00:00")
plot(early)
bottom <- window(adp, start=0, end=20, which="distance")
plot(bottom)



