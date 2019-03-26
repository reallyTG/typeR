library(kergp)


### Name: corLevDiag
### Title: Correlation or Covariance Matrix for a Diagonal Structure
### Aliases: corLevDiag

### ** Examples

set.seed(123)
checkGrad <- TRUE
nlevels <- 12
sigma2 <- rexp(n = nlevels)
T0 <- corLevDiag(nlevels = nlevels, par = sigma2, cov = 2)
L0 <- corLevDiag(nlevels = nlevels, par = sigma2, cov = 2,
                 lowerSQRT = TRUE)




