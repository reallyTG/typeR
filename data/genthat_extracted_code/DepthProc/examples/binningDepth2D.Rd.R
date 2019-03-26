library(DepthProc)


### Name: binningDepth2D
### Title: 2d Binning
### Aliases: binningDepth2D
### Keywords: depth function multivariate nonparametric robust

### ** Examples


# EXAMPLE 1
Sigma1 <- matrix(c(10, 3, 3, 2), 2, 2)
X1 <- mvrnorm(n = 8500, mu = c(0, 0), Sigma1)
Sigma2 <- matrix(c(10, 0, 0, 2), 2, 2)
X2 <- mvrnorm(n = 1500, mu = c(-10, 6), Sigma2)
BALLOT <- rbind(X1, X2)
train <- sample(1:10000, 500)
data <- BALLOT[train, ]
plot(data)

b1 <- binningDepth2D(data, remove_borders = FALSE, nbins = 12, k = 1)
b2 <- binningDepth2D(data, nbins = 12, k = 1, remove_borders = TRUE)
plot(b1)
plot(b2)

# EXAMPLE 2
data(under5.mort)
data(maesles.imm)
data2011 <- cbind(under5.mort[, 22], maesles.imm[, 22])
plot(binningDepth2D(data2011, nbins = 8, k = 0.5, remove_borders = TRUE))




