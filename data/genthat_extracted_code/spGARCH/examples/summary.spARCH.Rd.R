library(spGARCH)


### Name: summary.spARCH
### Title: Summary for spARCH object
### Aliases: summary.spARCH print.summary.spARCH print.spARCH
### Keywords: spARCH

### ** Examples

require("spdep")

# directional spatial ARCH process (W is triangular, 1:1 origin)

rho <- 0.5
alpha <- 1
d <- 5
n <- d^2
nblist <- cell2nb(d, d, type = "queen")
W <- nb2mat(nblist)
W[lower.tri(W)] <- 0
y <- sim.spARCH(n = n, rho = rho, alpha = alpha, W = W, type = "gaussian")

out <- qml.spARCH(y ~ 0, W = W, type = "gaussian")

summary(out)



