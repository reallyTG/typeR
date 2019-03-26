library(poistweedie)


### Name: rpoistweedie
### Title: Random generation for the Poisson-Tweedie family of
###   distributions
### Aliases: rpoistweedie
### Keywords: models

### ** Examples
   
## --------------- function rpoistweedie()---------------- ##
layout(matrix(2 :1, 2,1))
layout.show(2) 
power<-exp(30) 
mu<-10
lambda <- 10
theta0<--10
prob<-1-(mu/(1+mu))
lambda1<-100
n<-10
set.seed(123)
x1<-rpoistweedie(n,power,mu,lambda,theta0)
set.seed(123)
x2<-rpois(n,lambda1)
hist(x1, xlim = c(min(x1),max(x1)), probability = FALSE,
  col ='blue',xlab="modalit\'{e}s: x1",ylab="effectifs ",
  nclass = max(x1) - min(x1),main="Histogramme de x1 
 (lambda=100, n=10)")
hist(x2, xlim = c(min(x2),max(x2)), probability = FALSE, 
  col ='blue',xlab="modalit\'{e}s: x2 ",ylab="effectifs ",
  nclass = max(x2) - min(x2),main="Histogramme de x2 
  (lambda1=100, n=10)")
sum(x2-x1)



 






 


