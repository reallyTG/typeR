library(rddensity)


### Name: rddensity
### Title: Manipulation Testing Using Local-Polynomial Density Estimation
### Aliases: rddensity

### ** Examples

# density being continuous
set.seed(42)
x <- rnorm(2000, mean = -0.5)
summary(rddensity(X = x, vce="jackknife"))
# density being discontinuous
x[x>0] <- x[x>0] * 2
summary(rddensity(X = x, vce="jackknife"))




