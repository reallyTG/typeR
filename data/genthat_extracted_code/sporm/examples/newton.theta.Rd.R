library(sporm)


### Name: newton.theta
### Title: Initial theta value by Newton method
### Aliases: newton.theta

### ** Examples

theta<-2
u<-runif(30)
y<-u/(theta-(theta-1)*u)
newton.theta(y)



