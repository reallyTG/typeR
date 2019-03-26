library(spGARCH)


### Name: sim.spARCH
### Title: Simulation of spatial ARCH models
### Aliases: sim.spARCH
### Keywords: spatial ARCH spARCH

### ** Examples

require("spdep")

# 1st example
##############

# parameters

rho <- 0.5
alpha <- 1
d <- 2

nblist <- cell2nb(d, d, type = "queen")
W <- nb2mat(nblist)

# simulation

Y <- sim.spARCH(rho = rho, alpha = alpha, W = W, type = "exp")

# visualization

image(1:d, 1:d, array(Y, dim = c(d,d)), xlab = expression(s[1]), ylab = expression(s[2]))

# 2nd example
##############

# two spatial weighting matrices W_1 and W_2
# h = alpha + rho_1 W_1 Y^2 + rho_2 W_2 Y^2

W_1 <- W
nblist <- cell2nb(d, d, type = "rook")
W_2 <- nb2mat(nblist)

rho_1 <- 0.3
rho_2 <- 0.7

W <- rho_1 * W_1 + rho_2 * W_2
rho <- 1

Y <- sim.spARCH(n = d^2, rho = rho, alpha = alpha, W = W, type = "exp")
image(1:d, 1:d, array(Y, dim = c(d,d)), xlab = expression(s[1]), ylab = expression(s[2]))



