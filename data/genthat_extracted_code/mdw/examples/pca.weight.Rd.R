library(mdw)


### Name: pca.weight
### Title: Weights based on PCA
### Aliases: pca.weight
### Keywords: PCA

### ** Examples

library(MASS)
# a three biomarkers dataset generated from independent normal(0,1)
X = mvrnorm(n = 100, mu=rep(0,3), Sigma=diag(3), tol = 1e-6, empirical = FALSE, EISPACK = FALSE)
emp.cor <- cor(X)
pca.weight(emp.cor)



