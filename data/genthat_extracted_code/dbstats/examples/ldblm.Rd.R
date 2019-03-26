library(dbstats)


### Name: ldblm
### Title: Local distance-based linear model
### Aliases: ldblm ldblm.formula ldblm.dist ldblm.D2 ldblm.Gram print.ldblm

### ** Examples


# example to use of the ldblm function
n <- 100
p <- 1
k <- 5

Z <- matrix(rnorm(n*p),nrow=n)
b1 <- matrix(runif(p)*k,nrow=p)
b2 <- matrix(runif(p)*k,nrow=p)
b3 <- matrix(runif(p)*k,nrow=p)

s <- 1
e <- rnorm(n)*s


y <- Z%*%b1 + Z^2%*%b2 +Z^3%*%b3 + e

D2 <- as.matrix(dist(Z)^2)
class(D2) <- "D2"

ldblm1 <- ldblm(y~Z,kind.of.kernel=1,method="GCV",noh=3,k.knn=3)
ldblm2 <- ldblm(D2.1=D2,D2.2=D2,y,kind.of.kernel=1,method="user.h",k.knn=3)
 
 
 



