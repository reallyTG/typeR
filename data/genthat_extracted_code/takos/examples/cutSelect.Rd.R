library(takos)


### Name: cutSelect
### Title: Title cutSelect
### Aliases: cutSelect

### ** Examples

npoints=1000
x=seq(1,npoints)
y=(dnorm(x, mean=npoints/2, sd=npoints/10))
ycut=cutValue(y,10,40,0.003,0.001)
plot(y)
lines(ycut,col="red")




