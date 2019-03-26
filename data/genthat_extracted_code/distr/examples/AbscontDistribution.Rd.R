library(distr)


### Name: AbscontDistribution
### Title: Generating function "AbscontDistribution"
### Aliases: AbscontDistribution
### Keywords: distribution

### ** Examples

plot(Norm())
plot(AbscontDistribution(r = rnorm))
plot(AbscontDistribution(d = dnorm))
plot(AbscontDistribution(p = pnorm))
plot(AbscontDistribution(q = qnorm))
plot(Ac <- AbscontDistribution(d = function(x, log = FALSE){
                                   d <- exp(-abs(x^3))
                                   ## unstandardized!!
                                   if(log) d <- log(d)
                                   return(d)}, 
                         withStand = TRUE))



