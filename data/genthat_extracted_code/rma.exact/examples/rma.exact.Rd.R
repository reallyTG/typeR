library(rma.exact)


### Name: rma.exact
### Title: Compute an exact confidence interval for the grand mean in a
###   normal-normal random effects meta-analysis.
### Aliases: rma.exact

### ** Examples

set.seed(1)

K <- 5
c0 <- 1
mu0 <- 0
tau2 <- 12.5
vi <- (seq(1, 5, length=K))^2
yi <- rnorm(K)*sqrt(vi+tau2)+mu0
rma.exact(yi=yi,vi=vi)

## plotting a conifdence region and printing CIs with an RMA.Exact object
rma0 <- rma.exact(yi=yi,vi=vi,level=NULL)
plot(rma0)
confint(rma0)

## No test: 
## confidence region with multiple c0 values using an RMA.Exact object
c0 <- c(0,.25,1)
tau2 <- 12.5
vi <- (seq(1, 5, length=K))^2
yi=rnorm(K)*sqrt(vi+tau2)+mu0
rma0 <- rma.exact(yi=yi,vi=vi,c0=c0,level=NULL)
plot(rma0)
confint(rma0)

## setting tau2.bounds and other parameters to non-default values using an RMA.Exact object
Z <- matrix(rnorm(K*5e3),nrow=K)
B <- ncol(Z)
resolution <- 3e2
rma0 <- rma.exact(yi=yi,vi=vi,level=NULL,Z=Z,resolution=resolution,c0=c0,
tau2.bounds=c(1,120),resolution.tau2=1e3,resolution.mu=1e2)
plot(rma0)

c0 <- 1:4
rma0 <- rma.exact(yi=yi,vi=vi,level=NULL,Z=Z,resolution=resolution,c0=c0,
tau2.bounds=c(1,450),resolution.tau2=1e3,resolution.mu=1e2)
plot(rma0)
confint(rma0,level=c(.05))
## End(No test)



