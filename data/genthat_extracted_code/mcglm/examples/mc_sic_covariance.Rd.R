library(mcglm)


### Name: mc_sic_covariance
### Title: Score Information Criterion - Covariance
### Aliases: mc_sic_covariance

### ** Examples

set.seed(123)
SUBJECT <- gl(10, 10)
y <- rnorm(100)
data <- data.frame(y, SUBJECT)
Z0 <- mc_id(data)
Z1 <- mc_mixed(~0+SUBJECT, data = data)
# Reference model
fit0 <- mcglm(c(y ~ 1), list(Z0), data = data)
# Testing the effect of the matrix Z1
mc_sic_covariance(fit0, scope = Z1, idx = 1,
data = data, response = 1)
# As expected Tu < Chisq indicating non-significance of Z1 matrix



