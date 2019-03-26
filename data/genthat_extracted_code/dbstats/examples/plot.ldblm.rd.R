library(dbstats)


### Name: plot.ldblm
### Title: Plots for objects of clases ldblm or ldbglm
### Aliases: plot.ldblm plot.ldbglm

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

D2 <- as.matrix(dist(Z))^2
class(D2) <- "D2"

ldblm1 <- ldblm(D2,y=y,kind.of.kernel=1,method.h="AIC",noh=5,h.knn=NULL)
plot(ldblm1)
plot(ldblm1,which=3)





