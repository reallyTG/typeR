library(Gmedian)


### Name: Gmedian
### Title: Gmedian
### Aliases: Gmedian
### Keywords: Gmedian

### ** Examples

## Simulated data - Brownian paths
n <- 1e4
d <- 500
x <- matrix(rnorm(n*d,sd=1/sqrt(d)), n, d)
x <- t(apply(x,1,cumsum))

## Computation speed
system.time(replicate(10, {
  median.est = Gmedian(x)})) 
system.time(replicate(10, {
  mean.est = apply(x,2,mean)}))
##

## Accuracy with contaminated data
n <- 1e03
d <- 100
n.contaminated <- 50 ## 5% of contaminated observations
n.experiment <- 100
err.L2 <- matrix(NA,ncol=3,nrow=n.experiment)
colnames(err.L2) = c("mean (no contam.)", "mean (contam.)","Gmedian")

for (n.sim in 1:n.experiment){
x <- matrix(rnorm(n*d,sd=1/sqrt(d)), n, d)
x <- t(apply(x,1,cumsum))
err.L2[n.sim,1] <- sum((apply(x,2,mean))^2/d)
ind.contaminated <- sample(1:n,n.contaminated) ## contam. units
x[ind.contaminated,] <- 5 
err.L2[n.sim,2] <- sum((apply(x,2,mean))^2/d)
err.L2[n.sim,3] <- sum(Gmedian(x)^2/d)
}
boxplot(err.L2,main="L2 error")



