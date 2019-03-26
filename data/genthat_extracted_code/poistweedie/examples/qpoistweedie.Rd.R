library(poistweedie)


### Name: qpoistweedie
### Title: Quantile function for the Poisson-Tweedie family of
###   distributions
### Aliases: qpoistweedie
### Keywords: models

### ** Examples
   
## function qpoistweedie(p, power, mu,lambda,theta0,
## lower.tail = TRUE, log.p = FALSE)
## Plot qpois() and qpoistweedie() with log.p=FALSE
layout(matrix(1 :1, 1, 1))
layout.show(1) 
power<-exp(30) 
mu<-10
lambda <- 10
theta0<--10
prob<-1-(mu/(1+mu))
lambda1<-100
p <- runif(50)
p
## plot of qpoistweedie function with log=FALSE
d1<-ppoistweedie(p,power,mu,lambda,theta0,lower.tail=TRUE,log.p=FALSE)
d2<-ppois(p,lambda1,lower.tail=TRUE,log.p=FALSE)
erreure<- d1-d2
plot (p,d1,col='blue', type='h',xlab="p 
   avec  p=runif(50),  power=exp(30),mu=10, lambda=10, 
   theta0=-10, lambda1=100, lower.tail=TRUE", 
   ylab="quantile function P(100)",main = 
   "qpoistweedie(*,col='blue' log.p=FALSE)
   et qpois(*,col='red' log.p=FALSE)")
lines(p,d2,type ="p",col='red',lwd=2)
sum(abs(erreure))

 


