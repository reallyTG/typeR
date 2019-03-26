library(subcopem2D)


### Name: subcopemc
### Title: Bivariate Empirical Sucopula of Given Approximation Order
### Aliases: subcopemc
### Keywords: subcopula

### ** Examples

## Example 1: Independent Normal and Gamma

n <- 300  # sample size
X <- rnorm(n)         # Normal(0,1)
Y <- rgamma(n, 2, 3)  # Gamma(2,3)
XY <- cbind(X, Y)  # 2-column matrix with bivariate sample
cor(XY, method = "pearson")[1, 2]   # Pearson's correlation
cor(XY, method = "spearman")[1, 2]  # Spearman's correlation
cor(XY, method = "kendall")[1, 2]  # Kendall's correlation
SC <- subcopemc(XY,, display = TRUE)
str(SC)
## Approximation of order m = 15
SCm15 <- subcopemc(XY, 15, display = TRUE)
str(SCm15)

## Example 2: Non-monotone dependence

n <- 300  # sample size
Theta <- runif(n, 0, 2*pi)  # Uniform circular distribution
X <- cos(Theta)
Y <- sin(Theta)
XY <- cbind(X, Y)  # 2-column matrix with bivariate sample
cor(XY, method = "pearson")[1, 2]   # Pearson's correlation
cor(XY, method = "spearman")[1, 2]  # Spearman's correlation
cor(XY, method = "kendall")[1, 2]  # Kendall's correlation
SC <- subcopemc(XY,, display = TRUE)
str(SC)
## Approximation of order m = 15
SCm15 <- subcopemc(XY, 15, display = TRUE)
str(SCm15)



