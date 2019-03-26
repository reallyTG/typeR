library(ercv)


### Name: qpot
### Title: Quantile function
### Aliases: qpot
### Keywords: ercv

### ** Examples

qpot(0.1, c(evi=0.1, psi=0.2, threshold=0.3, prob=0.4), lower.tail=FALSE)

x<-runif(10000)
x<-c(x^-1,x)
pars<-fitpot(x,1)
qpot(0.5/10,pars,lower.tail=FALSE) #the true value is 10



