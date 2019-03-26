library(SimDesign)


### Name: IRMSE
### Title: Compute the integrated root mean-square error
### Aliases: IRMSE

### ** Examples


# logistic regression function with one slope and intercept
fn <- function(theta, param) 1 / (1 + exp(-(param[1] + param[2] * theta)))

# sample and population sets
est <- c(-0.4951, 1.1253)
pop <- c(-0.5, 1)

theta <- seq(-10,10,length.out=1000)
plot(theta, fn(theta, pop), type = 'l', col='red', ylim = c(0,1))
lines(theta, fn(theta, est), col='blue', lty=2)

# cumulative result (i.e., standard integral)
IRMSE(est, pop, fn)

# integrated RMSE result by marginalizing over a N(0,1) distribution
den <- function(theta, mean, sd) dnorm(theta, mean=mean, sd=sd)

IRMSE(est, pop, fn, den, mean=0, sd=1)

# this specification is equivalent to the above
den2 <- function(theta, ...) dnorm(theta, ...)

IRMSE(est, pop, fn, den2, mean=0, sd=1)




