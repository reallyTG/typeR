library(NSM3)


### Name: kolmogorov
### Title: Kolmogorov
### Aliases: kolmogorov
### Keywords: Kolmogorov Asymptotic

### ** Examples

velocity<-c(12.8, 12.9, 13.3, 13.4, 13.7, 13.8, 14.5)
kolmogorov(velocity,pnorm, mean=14,sd=2)
kolmogorov(velocity,pexp,1/2)



