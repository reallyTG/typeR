library(dbstats)


### Name: dblm
### Title: Distance-based linear model
### Aliases: dblm dblm.formula dblm.dist dblm.D2 dblm.Gram print.dblm

### ** Examples

# easy example to illustrate usage of the dblm function
n <- 100
p <- 3
k <- 5

Z <- matrix(rnorm(n*p),nrow=n)
b <- matrix(runif(p)*k,nrow=p)
s <- 1
e <- rnorm(n)*s
y <- Z%*%b + e

D<-dist(Z)

dblm1 <- dblm(D,y)
lm1 <- lm(y~Z)
# the same fitted values with the lm
mean(lm1$fitted.values-dblm1$fitted.values)




