library(distrEllipse)


### Name: plot-methods
### Title: Methods for Function plot in Package 'distrEllipse'
### Aliases: plot plot-methods plot,SphericalDistribution,missing-method
###   plot,MultivarMixingDistribution,missing-method
### Keywords: methods hplot distribution

### ** Examples

E0 <- matrix(c(2,1,1,4),2,2)%*%EllipticalDistribution()+c(2,1)
E1 <- matrix(c(3,2,2,4),2,2)%*%EllipticalDistribution(radDistr = exp(Binom(10,.8)))
plot(E0)
plot(E1, withED=FALSE, Nsim=5000)
mylist <- MultivarMixingDistribution(E0,E1, mixCoeff=c(1/4,3/4))
plot(mylist)



