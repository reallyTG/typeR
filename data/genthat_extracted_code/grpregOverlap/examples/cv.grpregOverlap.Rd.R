library(grpregOverlap)


### Name: cv.grpregOverlap
### Title: Cross-validation for choosing regularization parameter lambda
### Aliases: cv.grpregOverlap

### ** Examples

## linear regression, a simulation demo.
set.seed(123)
group <- list(gr1 = c(1, 2, 3),
              gr2 = c(1, 4),
              gr3 = c(2, 4, 5),
              gr4 = c(3, 5),
              gr5 = c(6))
beta.latent.T <- c(5, 5, 5, 0, 0, 0, 0, 0, 5, 5, 0) # true latent coefficients.
# beta.T <- c(5, 5, 10, 0, 5, 0), true variables: 1, 2, 3, 5; true groups: 1, 4.
X <- matrix(rnorm(n = 6*100), ncol = 6)
X.latent <- expandX(X, group)
y <- X.latent %*% beta.latent.T + rnorm(100)

cvfit <- cv.grpregOverlap(X, y, group, penalty = 'grMCP')
summary(cvfit)
plot(cvfit)
par(mfrow=c(2,2))
plot(cvfit, type="all")



