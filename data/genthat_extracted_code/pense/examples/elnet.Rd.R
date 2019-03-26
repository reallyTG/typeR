library(pense)


### Name: elnet
### Title: Elastic Net Estimator for Regression
### Aliases: elnet

### ** Examples

# Generate some dummy data
set.seed(12345)
n <- 30
p <- 15
x <- 1 + matrix(rnorm(n * p), ncol = p)
y <- x %*% c(2:5, numeric(p - 4)) + rnorm(n)

x_test <- matrix(rnorm(10 * n * p), ncol = p)
y_test <- drop(x_test %*% c(2:5, numeric(p - 4)) + rnorm(n))

# Compute the classical EN with predictions for x_test
set.seed(1234)
est <- elnet(
    x, y,
    alpha = 0.6,
    nlambda = 100,
    xtest = x_test
)

# Plot the RMSPE computed from the given test set
rmspe_test <- sqrt(colMeans((y_test - est$predictions)^2))
plot(est$lambda, rmspe_test, log = "x")

##
## For large data sets, the DAL algorithm is much faster
##
set.seed(12345)
n <- 100
p <- 1500
x <- 1 + matrix(rnorm(n * p), ncol = p)
y <- x %*% c(2:5, numeric(p - 4)) + rnorm(n)

x_test <- matrix(rnorm(10 * n * p), ncol = p)
y_test <- drop(x_test %*% c(2:5, numeric(p - 4)) + rnorm(n))

# The DAL algorithm takes ~1.5 seconds to compute the solution path
set.seed(1234)
system.time(
    est_dal <- elnet(
        x, y,
        alpha = 0.6,
        nlambda = 100,
        options = en_options_dal(),
        xtest = x_test
    )
)

## No test: 
# In comparison, the augmented LARS algorithm can take several minutes
set.seed(1234)
system.time(
    est_auglars <- elnet(
        x, y,
        alpha = 0.6,
        nlambda = 100,
        options = en_options_aug_lars(),
        xtest = x_test
    )
)
## End(No test)



