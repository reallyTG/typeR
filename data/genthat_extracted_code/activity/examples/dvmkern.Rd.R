library(activity)


### Name: dvmkern
### Title: Circular kernel probability density function.
### Aliases: dvmkern

### ** Examples

#Example with made up input
tt <- runif(100,0,2*pi)
xx <- seq(0,2*pi, pi/256)
pdf <- dvmkern(xx, tt)
plot(xx, pdf, type="l")



