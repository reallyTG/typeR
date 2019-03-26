library(takos)


### Name: smooth.loess
### Title: Title smooth.loess
### Aliases: smooth.loess

### ** Examples

npoints=1000
x=seq(1,npoints)
y=(dnorm(x, mean=npoints/2, sd=npoints/10))
y.smooth=smooth.loess(x,y)
plot(x,y)




