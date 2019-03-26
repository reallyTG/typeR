library(AdapSamp)


### Name: rCCARS
### Title: Concave-Convex Adaptive Rejection Sampling Algorithm
### Aliases: rCCARS

### ** Examples


# Example 1: Generalized inverse bounded gaussian distribution with lambda=-1 and a=b=2
x<-rCCARS(100,"x+x^-1","2*log(x)",0.001,100,1)
hist(x,breaks=20,probability =TRUE);lines(density(x,bw=0.1),col="red",lwd=2,lty=2)
f <- function(x) {x^(-2)*exp(-x-x^(-1))/0.2797318}
lines(seq(0,5,0.01),f(seq(0,5,0.01)),lwd=2,lty=3,col="blue")

#The following examples are also available;
#But it may take a few minutes to run them.

# Example 2: Expontional bounded distribution
# x<-rCCARS(1000,"x^4","-8*x^2+16",-3,4,c(-2,1))
# hist(x,breaks=30,probability=TRUE);lines(density(x,bw=0.05),col="blue",lwd=2,lty=2)
# f <- function(x) exp(-(x^2-4)^2)/ 0.8974381
# lines(seq(-3,4,0.01),f(seq(-3,4,0.01)),col="red",lty=3,lwd=2)

# Example 3: Makeham bounded distribution
# x<-rCCARS(1000,"x+1/log(2)*(2^x-1)","-log(1+2^x)",0,5,c(1,2,3))
# hist(x,breaks=30,probability=TRUE);lines(density(x,bw=0.05),col="blue",lwd=2,lty=2)
# f <- function(x){(1+2^x)*exp(-x-1/log(2)*(2^x-1))}
# lines(seq(0,5,0.01),f(seq(0,5,0.01)),col="red",lty=3,lwd=2,type="l")




