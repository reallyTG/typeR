library(ConnMatTools)


### Name: gammaParamsConvert
### Title: Gamma distribution shape and scale parameters from mean and
###   standard deviation, or vice-versa
### Aliases: gammaParamsConvert

### ** Examples

library(ConnMatTools)
mn <- 1
sd <- 0.4
l <- gammaParamsConvert(mean=mn,sd=sd)
x <- seq(0,2,length.out=50)

# Plot gamma and normal distributions - for sd << mean, the two should be very close
plot(x,dgamma(x,l$shape,scale=l$scale),
     main="Normal versus Gamma distributions",type="l")
lines(x,dnorm(x,l$mean,l$sd),col="red")



