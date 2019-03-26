library(MixGHD)


### Name: cMSGHD
### Title: Convex mixture of multiple scaled generalized hyperbolic
###   distributions (cMSGHD).
### Aliases: cMSGHD
### Keywords: Clustering Generalized hyperboilc distribution

### ** Examples

## No test: 
##Generate random data
set.seed(3)

mu1 <- mu2 <- c(0,0)
Sigma1 <- matrix(c(1,0.85,0.85,1),2,2)
Sigma2 <- matrix(c(1,-0.85,-0.85,1),2,2)

X1 <- mvrnorm(n=150,mu=mu1,Sigma=Sigma1)
X2 <- mvrnorm(n=150,mu=mu2,Sigma=Sigma2)

X <- rbind(X1,X2)

##model estimation
em=cMSGHD(X,G=2,max.iter=30,method="random",nr=2)



#result
plot(em)
## End(No test)


