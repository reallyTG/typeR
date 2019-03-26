library(lspartition)


### Name: lsplincom
### Title: Linear Combination of Estimators for 'lspartition' Package
### Aliases: lsplincom print.lsplincom summary.lsplincom

### ** Examples

x   <- runif(500)
y   <- sin(4*x)+rnorm(500)
z   <- c(rep(0, 250), rep(1, 250))
est <- lsplincom(y, x, z, c(-1, 1))
summary(est)




