library(LeArEst)


### Name: lengthtest
### Title: Test for uniform distribution width.
### Aliases: lengthtest

### ** Examples

# generate uniform data with additive error and run a hypothesis testing on it
sample_1 <- runif(1000, -1, 1)
sample_2 <- rnorm(1000, 0, 0.1)
sample <- sample_1 + sample_2
out <- lengthtest(x = sample, error = "gauss", alternative = "greater",
                  var.est = "MM", null.a = 0.997, conf.level = 0.95)




