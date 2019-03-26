library(AdapSamp)


### Name: rMARS
### Title: Modified Adaptive Rejection Sampling Algorithm
### Aliases: rMARS

### ** Examples

# Example 1: Exponential distribution
x <- rMARS(100,"exp(-(4-x^2)^2)",-Inf,Inf, c(-2.5,0,2.5),c(-2/sqrt(3),2/sqrt(3)))
hist(x,probability=TRUE,xlim=c(-3,3),ylim=c(0,1.2),breaks=20)
lines(density(x,bw=0.05),col="blue")
f <- function(x)(exp(-(4-x^2)^2))
lines(seq(-3,3,0.01),f(seq(-3,3,0.01))/integrate(f,-3,3)[[1]],lwd=2,lty=2,col="red")

#The following examples are also available;
#But it may take a few minutes to run them.

# Example 2: Distribution with bounded domain
# x <- rMARS(1000,"exp(-(x^2-x^3))",-3,2,c(-1,1),1/3)
# hist(x,probability=TRUE,xlim=c(-3,2.5),ylim=c(0,1.2),breaks=20)
# lines(density(x,bw=0.2),col="blue")
# f <- function(x) exp(-(x^2-x^3))
# lines(seq(-3,2,0.01),f(seq(-3,2,0.01))/integrate(f,-3,2)[[1]],lwd=2,lty=2,col="red",type="l")


# Example 3: Weibull distribution with k=3 and lambda=1
# x <- rMARS(100,"3*x^2*exp(-x^3)",10^-15,Inf,c(0.01,1),(1/3)^(1/3),m=10^-4)
# hist(x,probability=TRUE,breaks=20,xlim=c(0,2))
# lines(density(x,bw=0.15),col="blue")
# f <- function(x) 3*x^2*exp(-x^3)
# lines(seq(0,2,0.01),f(seq(0,2,0.01)),lwd=2,lty=2,col="red",type="l")


# Example 4: Mixed normal distribution with p=0.3,m1=2,m2=8,sigma1=1,sigma2=2
# x <- rMARS(100,"0.3/sqrt(2*pi)*exp(-(x-2)^2/2)+(1-0.3)/sqrt(2*pi)/2*exp(-(x-8)^2/8)",-Inf,Inf,
# c(-6,-4,0,3,6,15),c(-5.120801,-3.357761,3.357761,5.120801),m=10^-8)
# hist(x,breaks=20,probability=TRUE);lines(density(x,bw=0.45),col="blue",lwd=2)
# f <- function(x)0.3/sqrt(2*pi)*exp(-(x-2)^2/2)+(1-0.3)/sqrt(2*pi)/2*exp(-(x-8)^2/8)
# lines(seq(0,14,0.01),f(seq(0,14,0.01)),lty=3,col="red",lwd=2 )




