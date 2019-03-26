library(stdReg)


### Name: stdGee
### Title: Regression standardization in conditional generalized estimating
###   equations
### Aliases: stdGee

### ** Examples


require(drgee)

n <- 1000
ni <- 2
id <- rep(1:n, each=ni)
ai <- rep(rnorm(n), each=ni)
Z <- rnorm(n*ni)
X <- rnorm(n*ni, mean=ai+Z)
Y <- rnorm(n*ni, mean=ai+X+Z+0.1*X^2)
dd <- data.frame(id, Z, X, Y)
fit <- gee(formula=Y~X+Z+I(X^2), data=dd, clusterid="id", link="identity",
  cond=TRUE)
fit.std <- stdGee(fit=fit, data=dd, X="X", x=seq(-3,3,0.5), clusterid="id")
print(summary(fit.std, contrast="difference", reference=2))
plot(fit.std)




