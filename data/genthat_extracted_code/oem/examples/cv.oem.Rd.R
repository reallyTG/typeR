library(oem)


### Name: cv.oem
### Title: Cross validation for Orthogonalizing EM
### Aliases: cv.oem

### ** Examples

set.seed(123)
n.obs <- 1e4
n.vars <- 100

true.beta <- c(runif(15, -0.25, 0.25), rep(0, n.vars - 15))

x <- matrix(rnorm(n.obs * n.vars), n.obs, n.vars)
y <- rnorm(n.obs, sd = 3) + x %*% true.beta

fit <- cv.oem(x = x, y = y, 
              penalty = c("lasso", "grp.lasso"), 
              groups = rep(1:20, each = 5))

layout(matrix(1:2, ncol = 2))
plot(fit)
plot(fit, which.model = 2)



