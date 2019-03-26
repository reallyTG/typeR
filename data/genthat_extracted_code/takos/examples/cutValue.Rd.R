library(takos)


### Name: cutValue
### Title: Title cutValue
### Aliases: cutValue

### ** Examples

npoints=1000
x=seq(1,npoints)
y=(dnorm(x, mean=npoints/2, sd=npoints/10))
ycut=cutSelect(y,10,40)
plot(y)
lines(ycut,col="red")




