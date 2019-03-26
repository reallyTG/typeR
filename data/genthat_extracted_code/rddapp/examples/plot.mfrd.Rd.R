library(rddapp)


### Name: plot.mfrd
### Title: Plot the Multivariate Frontier Regression Discontinuity
### Aliases: plot.mfrd

### ** Examples

set.seed(12345)
x1 <- runif(1000, -1, 1)
x2 <- runif(1000, -1, 1)
cov <- rnorm(1000)
y <- 3 + 2 * (x1 >= 0) + 3 * cov + 10 * (x2 >= 0) + rnorm(1000)
model <- mfrd_est(y = y, x1 = x1, x2 = x2, c1 = 0, c2 = 0, t.design = c("geq", "geq"))
plot(model, "m_s")



