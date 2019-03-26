library(ifa)


### Name: ifa.bic
### Title: A function to compute the BIC
### Aliases: ifa.bic
### Keywords: multivariate

### ** Examples

data(memory)
fit<-ifa.em(memory$x,c(2,2),it=50,eps=0.001)
ifa.bic(fit)



