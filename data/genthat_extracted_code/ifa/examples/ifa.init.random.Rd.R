library(ifa)


### Name: ifa.init.random
### Title: A function to randomly inizialize the IFA parameters
### Aliases: ifa.init.random
### Keywords: multivariate

### ** Examples

data(memory)
init.values<-ifa.init.random(memory$x,2)
fit<-ifa.em(memory$x,c(2,2),it=50,eps=0.0001,init.values)



