library(polspline)


### Name: oldlogspline
### Title: Logspline Density Estimation - 1992 version
### Aliases: oldlogspline
### Keywords: distribution smooth

### ** Examples

# A simple example
y <- rnorm(100)
fit <- oldlogspline(y)       
plot(fit)
# An example involving censoring and a lower bound
y <- rlnorm(1000)
censoring <- rexp(1000) * 4
delta <- 1 * (y <= censoring)
y[delta == 0] <- censoring[delta == 0]
fit <- oldlogspline(y[delta == 1], y[delta == 0], lbound = 0)



