library(DepthProc)


### Name: CovLP
### Title: CovLp
### Aliases: CovLP
### Keywords: depth function multivariate nonparametric robust

### ** Examples

# EXAMPLE 1
x <- mvrnorm(n = 100, mu = c(0, 0), Sigma = 3 * diag(2))
cov_x <- CovLP(x, 2, 1, 1)

# EXAMPLE 2
data(under5.mort, inf.mort, maesles.imm)
data1990 <- na.omit(cbind(under5.mort[, 1], inf.mort[, 1], maesles.imm[, 1]))
CovLP(data1990)




