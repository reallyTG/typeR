library(gamlss.dist)


### Name: ZAIG
### Title: The zero adjusted Inverse Gaussian distribution for fitting a
###   GAMLSS model
### Aliases: ZAIG plotZAIG dZAIG pZAIG qZAIG rZAIG meanZAIG
### Keywords: distribution regression

### ** Examples

ZAIG()# gives information about the default links for the ZAIG distribution
# plotting the distribution
plotZAIG( mu =10 , sigma=.5, nu = 0.1, from = 0, to=10, n = 101)
# plotting the cdf
plot(function(y) pZAIG(y, mu=10 ,sigma=.5, nu = 0.1 ), 0, 1)
# plotting the inverse cdf
plot(function(y) qZAIG(y, mu=10 ,sigma=.5, nu = 0.1 ), 0.001, .99)
# generate random numbers
dat <- rZAIG(100,mu=10,sigma=.5, nu=.1)
# fit a model to the data 
# library(gamlss)
# m1<-gamlss(dat~1,family=ZAIG)
# meanZAIG(m1)[1]




