library(subcopem2D)


### Name: subcopem
### Title: Bivariate Empirical Subcopula
### Aliases: subcopem
### Keywords: subcopula

### ** Examples

## Example 1: Discrete-discrete Poisson positive dependence
n <- 1000  # sample size
X <- rpois(n, 5)  # Poisson(parameter = 5)
p <- 2  # another parameter
Y <- mapply(rpois, rep(1, n), 1 + p*X)  # creating dependence
XY <- cbind(X, Y)  # 2-column matrix with bivariate sample
cor(XY, method = "pearson")[1, 2]   # Pearson's correlation
cor(XY, method = "spearman")[1, 2]  # Spearman's correlation
cor(XY, method = "kendall")[1, 2]  # Kendall's correlation
SC <- subcopem(XY, display = TRUE)
str(SC)

## Example 2: Continuous-discrete non-monotone dependence
n <- 1000      # sample size
X <- rnorm(n)                  # Normal(0,1)
Y <- 2*(X > 1) - 1*(X > -1)    # Discrete({-1, 0, 1})
XY <- cbind(X, Y)  # 2-column matrix with bivariate sample
cor(XY, method = "pearson")[1, 2]   # Pearson's correlation
cor(XY, method = "spearman")[1, 2]  # Spearman's correlation
cor(XY, method = "kendall")[1, 2]  # Kendall's correlation
SC <- subcopem(XY, display = TRUE)
str(SC)



