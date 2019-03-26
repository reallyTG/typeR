library(spGARCH)


### Name: qml.SARspARCH
### Title: Maximum-likelihood estimation of a spatial autoregressive model
###   with spatial ARCH residuals
### Aliases: qml.SARspARCH
### Keywords: Spatial Autoregressive Model with spARCH Residuals QML
###   SARspARCH

### ** Examples

require("spdep")
rho <- 0.5
alpha <- 1
lambda <- 0.5
d <- 5
n <- d^2
nblist <- cell2nb(d, d, type = "queen")
W <- nb2mat(nblist)
B <- W

X <- cbind(rep(1, n), rnorm(n))
beta <- c(5, 2)

y <- solve(diag(n) - lambda * B) %*%
    (sim.spARCH(n = n, rho = rho, alpha = alpha, W = W, type = "exp") + X %*% beta)
y <- as.vector(y)
out <- qml.SARspARCH(y ~ X[,2], B = B, W = W, type = "exp")

summary(out)



