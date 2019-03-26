library(takos)


### Name: runningIntegral
### Title: Title running integral
### Aliases: runningIntegral

### ** Examples

npoints=1000
x=seq(1,npoints)
y=(dnorm(x, mean=npoints/2, sd=npoints/10))
runningIntegral(x,y)



