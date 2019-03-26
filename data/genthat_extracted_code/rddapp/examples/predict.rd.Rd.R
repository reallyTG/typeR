library(rddapp)


### Name: predict.rd
### Title: Prediction the Regression Discontinuity
### Aliases: predict.rd

### ** Examples

x <- runif(1000, -1, 1)
cov <- rnorm(1000)
y <- 3 + 2 * x + 3 * cov + 10 * (x >= 0) + rnorm(1000)
tr <- as.integer(x >= 0)
rd <- rd_est(y ~ x + tr | cov, cutpoint = 0, t.design = "geq") 
predict(rd)



