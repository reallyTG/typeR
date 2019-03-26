library(VGAMextra)


### Name: MVNcov
### Title: Multivariate Normal Distribution Family Function
### Aliases: MVNcov

### ** Examples

# K = 3.
set.seed(180227)
nn  <- 85
mvndata <- data.frame(x2 = runif(nn), x3 = runif(nn))
mvndata <- transform(mvndata, 
                     y = rbinorm(nn, mean1 = 2 - 2 * x2 + 1 * x3,
                          mean2 = 2 - 1.5 * x3,
                          var1 = exp(1.0), var2 = exp(-0.75),
                          cov12 = 0.5 * exp(1.0) * exp(-0.75)))
mvndata <- transform(mvndata, y3 = rnorm(nn, mean = 2 + x2, sd = exp(1.5)))
colnames(mvndata) <- c("x2", "x3", "y1", "y2", "y3")

mvnfit <- vglm(cbind(y1, y2, y3) ~ x2 + x3, MVNcov, data = mvndata, trace = TRUE)
(mvncoef  <- coef(mvnfit, mat = TRUE))

## Check variances and covariances: var1, var2 and var3.
exp(mvncoef[c(10, 13, 16)])  # True are var1 = exp(1.0) = 2.718, 
                             # var2 = exp(-0.75) = 0.472
                             # and var3 = exp(1.5)^2 = 20.08554
vcov(mvnfit)
constraints(mvnfit)
summary(mvnfit)





