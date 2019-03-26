library(GEOmap)


### Name: getmagsize
### Title: Earthquake Magnitude based on exponentional
### Aliases: getmagsize
### Keywords: misc

### ** Examples


mag = 0:9

x = runif(10, 1, 100)
y  = runif(10, 1, 100)

g = getmagsize(mag)

plot(c(0, 100), c(0, 100), asp=1, type='n')

points(x, y, pch=1, cex=g)







