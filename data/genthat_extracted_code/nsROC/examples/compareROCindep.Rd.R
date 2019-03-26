library(nsROC)


### Name: compareROCindep
### Title: Comparison of k independent ROC curves
### Aliases: compareROCindep compareROCindep.default
### Keywords: comparison

### ** Examples

set.seed(123)
X1 <- c(rnorm(45), rnorm(30,2,1.5))
D1 <- c(rep(0,45), rep(1,30))
X2 <- c(rnorm(45), rnorm(38,3,1.5))
D2 <- c(rep(0,45), rep(1,38))
X3 <- c(rnorm(30), rnorm(42,3,1))
D3 <- c(rep(0,30), rep(1,42))
X <- c(X1, X2, X3)
D <- c(D1, D2, D3)
G <- c(rep(1,75), rep(2,83), rep(3,72))

## No test: 
# Default method: L1 statistic proposed in Martinez-Camblor
output <- compareROCindep(X, G, D)

# Venkatraman statistic
output1 <- compareROCindep(X, G, D, statistic="VK")

# DeLong AUC comparison methodology
output2 <- compareROCindep(X, G, D, statistic="AUC")
## End(No test)



