library(bootruin)


### Name: rpdataboot
### Title: Creating Bootstrap Replications from an Matrix of Observations
### Aliases: rpdataboot
### Keywords: array datagen distribution internal

### ** Examples

# Generate a data matrix of 5 samples with 10 observations each.
x <- matrix(rexp(50), nrow = 10, ncol = 5)

# Create (parametric) bootstrap replications
x.boot.par <- bootruin:::rpdataboot(x, b = 50, method = "exp")

# Create (non-parametric) bootstrap replications
x.boot.nonp <- bootruin:::rpdataboot(x, b = 50, method = "nonp")



