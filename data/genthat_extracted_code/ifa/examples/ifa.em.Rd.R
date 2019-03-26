library(ifa)


### Name: ifa.em
### Title: Fitting an Independent Factor Analysis model by the EM algorithm
### Aliases: ifa.em
### Keywords: multivariate

### ** Examples

data(memory)
init.values<-ifa.init.random(memory$x,2)
fit<-ifa.em(memory$x,c(2,2),it=50,eps=0.0001,init.values)

fit<-ifa.em(memory$x,c(2,2),it=50,eps=0.0001)
plot(ifa.predict(scale(memory$x),fit))



