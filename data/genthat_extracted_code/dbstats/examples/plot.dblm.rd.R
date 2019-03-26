library(dbstats)


### Name: plot.dblm
### Title: Plots for objects of clases dblm or dbglm
### Aliases: plot.dblm plot.dbglm

### ** Examples


n <- 64
p <- 4
k <- 3

Z <- matrix(rnorm(n*p),nrow=n)
b <- matrix(runif(p)*k,nrow=p)
s <- 1
e <- rnorm(n)*s
y <- Z%*%b + e

dblm1 <- dblm(y~Z,metric="gower",method="GCV", full.search=FALSE)
plot(dblm1)
plot(dblm1,which=4)




