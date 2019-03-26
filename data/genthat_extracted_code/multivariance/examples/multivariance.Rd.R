library(multivariance)


### Name: multivariance
### Title: distance multivariance
### Aliases: multivariance

### ** Examples

multivariance(matrix(rnorm(100*3),ncol = 3)) #independent sample
multivariance(coins(100)) #dependent sample which is 2-independent

x = matrix(rnorm(100*2),ncol = 2)
x = cbind(x,x[,2])
multivariance(x) #dependent sample which is not 2-independent (thus small values are meaningless!)
multivariance(x[,1:2]) #these are independent
multivariance(x[,2:3]) #these are dependent

multivariance(x[,2:3],correlation = TRUE)




