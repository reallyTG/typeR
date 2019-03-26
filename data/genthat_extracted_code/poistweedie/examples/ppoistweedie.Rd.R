library(poistweedie)


### Name: ppoistweedie
### Title: Distribution function for the Poisson-Tweedie family
### Aliases: ppoistweedie
### Keywords: models

### ** Examples
   
## function ppoistweedie(q, power, mu,lambda,theta0,
## lower.tail = TRUE, log.p = FALSE)
## Plot ppois() et ppoistweedie() avec log.p=FALSE
layout(matrix(1 :1, 1, 1))
layout.show(1)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
power<-exp(30) 
mu<-5
lambda <- 5
theta0<--5
prob<-1-(mu/(1+mu))
lambda1<-lambda^2
q <- 0:100
## function ppoistweedie function with log=FALSE
d1<-ppoistweedie(q,power,mu,lambda,theta0,lower.tail=TRUE,log.p=FALSE)
d2<-ppois(q,lambda1,lower.tail=TRUE,log.p=FALSE)
erreure<- d1-d2
plot (q,d1,col='blue', type='h',xlab="q    
 avec  q=0:100,  power=exp(30),mu=5, lambda=5, 
 theta0=-5, lambda1=25", ylab="fonction de 
 repartition P(25)",main = "ppoistweedie(*,col='blue' log=FALSE)
 et ppois(*,col='red' log=FALSE)")
lines(q,d2,type ="p",col='red',lwd=2)
sum(abs(erreure))





