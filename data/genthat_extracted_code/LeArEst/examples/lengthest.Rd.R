library(LeArEst)


### Name: lengthest
### Title: Performs width estimation for a numerical data set.
### Aliases: lengthest

### ** Examples

# generate uniform data with additive error and run a length estimation on it
sample_1 <- runif(1000, -1, 1)
sample_2 <- rnorm(1000, 0, 0.1)
sample <- sample_1 + sample_2
out <- lengthest(x = sample, error = "gauss", var.est = "MM", conf.level = 0.90)




