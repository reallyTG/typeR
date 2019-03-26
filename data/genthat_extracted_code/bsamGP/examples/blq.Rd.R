library(bsamGP)


### Name: blq
### Title: Bayesian Quantile Regression
### Aliases: blq
### Keywords: quantile regression model parametric model

### ** Examples

#####################
# Simulated example #
#####################

# Simulate data
set.seed(1)

n <- 100
w <- runif(n)
y <- 3 + 2*w + rald(n, scale = 0.8, p = 0.5)

# Fit median regression
fout <- blq(y ~ w, p = 0.5)

# Summary
print(fout); summary(fout)

# fitted values
fit <- fitted(fout)

# Plots
plot(fout)



