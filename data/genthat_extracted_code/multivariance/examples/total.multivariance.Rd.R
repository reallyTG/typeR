library(multivariance)


### Name: total.multivariance
### Title: total distance multivariance
### Aliases: total.multivariance

### ** Examples

x = matrix(rnorm(100*3),ncol = 3)
total.multivariance(x) #for an independent sample
# the value coincides with
(multivariance(x[,c(1,2)],Nscale = TRUE) + multivariance(x[,c(1,3)],Nscale = TRUE)+
 multivariance(x[,c(2,3)],Nscale = TRUE) + multivariance(x,Nscale = TRUE))/4

total.multivariance(coins(100)) #value for a dependent sample which is 2-independent




