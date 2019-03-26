library(ars)


### Name: ars
### Title: Adaptive Rejection Sampling
### Aliases: ars
### Keywords: distribution

### ** Examples


library(ars)

#Example 1: sample 20 values from the normal distribution N(2,3)
f<-function(x,mu=0,sigma=1){-1/(2*sigma^2)*(x-mu)^2}
fprima<-function(x,mu=0,sigma=1){-1/sigma^2*(x-mu)}
mysample<-ars(20,f,fprima,mu=2,sigma=3)
mysample
hist(mysample)

#Example 2: sample 20 values from a gamma(2,0.5)
f1<-function(x,shape,scale=1){(shape-1)*log(x)-x/scale}
f1prima<-function(x,shape,scale=1) {(shape-1)/x-1/scale}
mysample1<-ars(20,f1,f1prima,x=4.5,m=1,lb=TRUE,xlb=0,shape=2,scale=0.5)
mysample1
hist(mysample1)

#Example 3: sample 20 values from a beta(1.3,2.7) distribution
f2<-function(x,a,b){(a-1)*log(x)+(b-1)*log(1-x)}
f2prima<-function(x,a,b){(a-1)/x-(b-1)/(1-x)}
mysample2<-ars(20,f2,f2prima,x=c(0.3,0.6),m=2,lb=TRUE,xlb=0,ub=TRUE,xub=1,a=1.3,b=2.7)
mysample2
hist(mysample2)



