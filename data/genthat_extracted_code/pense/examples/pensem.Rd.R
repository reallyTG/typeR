library(pense)


### Name: pensem
### Title: Perform an M-step after the EN S-Estimator
### Aliases: pensem pensem.default pensem.pense

### ** Examples

##
## A very simple example on artificial data
##

# Generate some dummy data
set.seed(12345)
n <- 30
p <- 15
x <- 1 + matrix(rnorm(n * p), ncol = p)
y <- x %*% c(2:5, numeric(p - 4)) + rnorm(n)

x_test <- 1 + matrix(rnorm(10 * n * p), ncol = p)
y_test <- x_test %*% c(2:5, numeric(p - 4)) + rnorm(n)

# Compute the MM-estimator with an EN penalty for 30 lambda values
# (Note: In real applications, warm_reset should be at least 5)
set.seed(1234)
est_mm <- pensem(
    x, y,
    alpha = 0.7,
    nlambda = 20,
    warm_reset = 1L,
    cv_k = 3
)

# We can plot the CV prediction error curve
plot(est_mm)

# What is the RMSPE on test data
(rmspe <- sqrt(mean((y_test - predict(est_mm, newdata = x_test))^2)))

##
## This is the same as computing first the S-estimator and adding the
## M-step afterwards
##
set.seed(1234)
est_s <- pense(
    x, y,
    alpha = 0.7,
    nlambda = 20,
    warm_reset = 1L,
    cv_k = 3
)

est_mm_2 <- pensem(
    est_s,
    nlambda = 20,
    cv_k = 3
)

## The initial S-estimate is the same used in both `pensem` calls
## because the seed which governs the CV to select the optimal lambda was the
## same
sum(abs(est_s$coefficients - est_mm$sest$coefficients))
## Therefore, the MM-estimate at each lambda is also the same
sum(abs(est_mm_2$coefficients - est_mm$coefficients))



