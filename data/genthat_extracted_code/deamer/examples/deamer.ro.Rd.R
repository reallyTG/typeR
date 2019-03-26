library(deamer)


### Name: deamerRO
### Title: Density estimation using an auxiliary sample of replicate noisy
###   observations.
### Aliases: deamerRO

### ** Examples

set.seed(123)
n=1000 #sample size of single noisy observtions
M=500 #sample size of replicate observations

rff=function(x){
  u=rbinom(x, 1, 0.5)
  X=u*rnorm(x, -2, 1)+(1-u)*rnorm(x,2,1)
  return(X)
}
x <- rff(n) #a mixed gaussian distribution

# true density function:
f.true=function(x) (0.5/(sqrt(2*pi)))*(exp(-0.5*(x+2)^2) + exp(-0.5*(x-2)^2))

e <- rnorm(n,0,0.5)
y <- x + e

x. <- rff(M)

e1 <- rnorm(M,0,0.5)
e2 <- rnorm(M,0,0.5)
rep<-data.frame(y1=x.+e1, y2=x.+e2)

est<-deamerRO(y, replicates=rep)
est

plot(est, lwd=2)
curve(f.true(x), add=TRUE, lwd=2, lty=3)
lines(density(y), lwd=2, lty=4)
legend("topleft", bty="n", lty=c(1,3,4), lwd=2, legend=c("deamerRO", "true density", 
       "kernel density\nof noisy obs."))




