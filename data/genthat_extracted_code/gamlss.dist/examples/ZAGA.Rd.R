library(gamlss.dist)


### Name: ZAGA
### Title: The zero adjusted Gamma distribution for fitting a GAMLSS model
### Aliases: ZAGA plotZAGA dZAGA pZAGA qZAGA rZAGA meanZAGA
### Keywords: distribution regression

### ** Examples

ZAGA()# gives information about the default links for the ZAGA distribution
# plotting the function
PPP <- par(mfrow=c(2,2))
plotZAGA(mu=1, sigma=.5, nu=.2, from=0,to=3)
#curve(dZAGA(x,mu=1, sigma=.5, nu=.2), 0,3) # pdf
curve(pZAGA(x,mu=1, sigma=.5, nu=.2), 0,3,  ylim=c(0,1)) # cdf
curve(qZAGA(x,mu=1, sigma=.5, nu=.2), 0,.99) # inverse cdf
y<-rZAGA(100, mu=1, sigma=.5, nu=.2) # randomly generated values
hist(y)
par(PPP)
# check that the  positive part sums up to .8 (since nu=0.2)  
integrate(function(x) dZAGA(x,mu=1, sigma=.5, nu=.2), 0,Inf)



