library(poistweedie)


### Name: dpoistweedie
### Title: The individual probabilities of Y when Y follows a
###   Poisson-Tweedie Distributions
### Aliases: dpoistweedie densitept1 densitept2 dpt1 dpt1Log dpt2 dpt2Log
###   dptp dptpLog gam1.1 gam1.2 imfx0 moyennePT omega testOmegaPT
### Keywords: models

### ** Examples
   
## dpoistweedie(y, power, mu,lambda,theta0,log = FALSE)
## Plot dpois() and dpoistweedie() with  log=FALSE
layout(matrix(1 :1, 1, 1))
layout.show(2) 
power <- exp(10) 
mu <-10
lambda <- 10
theta0<--10
lambda1<-100
y <- 0:200
## plot  dpoistweedie function with log = FALSE
d1<-dpoistweedie(y,power,mu,lambda,theta0,log = FALSE)
d2<-dpois(y,lambda1,log=FALSE)
erreure<-d1-d2
plot (y,d1,col='blue', type='h',xlab="y 
   avec  y=0:200,  power=exp(30),mu=10, lambda=10,
   theta0=-10,  lambda1=100", ylab="densite P(100)",
   main = "dpoistweedie(*,col='blue' log=FALSE)
   et dpois(*,col='red' log=FALSE)")
lines(y,d2,type ="p",col='red',lwd=2)
sum(abs(erreure))



## Plot dnbinom() and dpoistweedie()
layout(matrix(1 :1, 1, 1))
layout.show(2) 
power<-2 
mu<-10
lambda <- 1
theta0<-0
prob<-1-(mu/(1+mu))
y <- seq(0,50, by =3)
## plot a dpoistweedie function with log=FALSE
d1<-dpoistweedie(y,power,mu,lambda,theta0,log=FALSE)
d2<-dnbinom(y,lambda,prob, log=FALSE)
erreure<-d1-d2
plot (y,d1,col='blue', type='h',xlab="y 
   avec  y=seq(0,50,by=3),  power=2,mu=10, 
   lambda=1, thetao=0", ylab="densite NB(1,1/11)"
   ,main = "dnpoistweedie(*,col='blue' log=FALSE)
   et dnbinom(*,col='red' log=FALSE)")
lines(y,d2,type ="p",col='red',lwd=2)
abs(erreure)
 


