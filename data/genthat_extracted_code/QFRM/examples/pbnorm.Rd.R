library(QFRM)


### Name: pbnorm
### Title: Bivariate Standard Normal CDF
### Aliases: pbnorm

### ** Examples

pbnorm(1, 1, .5)
#pbnorm(2, 2, 0)
#pbnorm(-1, -1, .35)
#pbnorm(0, 0, 0)

ttl = 'cdf of x, at y=0'
X = seq(-5,5,1)
graphics::plot(X, sapply(X, function(x) pbnorm(0,x,0)), type='l', main=ttl)



