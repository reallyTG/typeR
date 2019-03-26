library(DepthProc)


### Name: mWilcoxonTest
### Title: Multivariate Wilcoxon test for equality of dispersion.
### Aliases: mWilcoxonTest

### ** Examples


# EXAMPLE 1
x <- mvrnorm(100, c(0, 0), diag(2))
y <- mvrnorm(100, c(0, 0), diag(2) * 1.4)
mWilcoxonTest(x, y)
mWilcoxonTest(x, y, depth_params = list(method = "LP"))

# EXAMPLE 2
data(under5.mort)
data(inf.mort)
data(maesles.imm)
data2011 <- na.omit(cbind(under5.mort[, 22], inf.mort[, 22],
                          maesles.imm[, 22]))
data1990 <- na.omit(cbind(under5.mort[, 1], inf.mort[, 1], maesles.imm[, 1]))
mWilcoxonTest(data2011, data1990)




