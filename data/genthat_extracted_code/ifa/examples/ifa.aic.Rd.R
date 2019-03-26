library(ifa)


### Name: ifa.aic
### Title: A function to compute the AIC
### Aliases: ifa.aic
### Keywords: multivariate

### ** Examples

data(memory)
fit<-ifa.em(memory$x,c(2,2),it=50,eps=0.001)
ifa.aic(fit)



