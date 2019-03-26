library(stepR)


### Name: stepFit
### Title: Piecewise constant multiscale inference
### Aliases: stepFit
### Keywords: nonparametric

### ** Examples

# generate random observations
y <- c(rnorm(50), rnorm(50, 1))
x <- seq(0.01, 1, 0.01)
plot(x, y, pch = 16, col = "grey30", ylim = c(-3, 4))

# computation of SMUCE and its confidence statements
fit <- stepFit(y, x = x, alpha = 0.5, jumpint = TRUE, confband = TRUE)
lines(fit, lwd = 3, col = "red", lty = "22")

# confidence intervals for the change-point locations
points(jumpint(fit), col = "red")
# confidence band
lines(confband(fit), lty = "22", col = "darkred", lwd = 2)

# higher significance level for larger detection power, but less confidence
stepFit(y, x = x, alpha = 0.99, jumpint = TRUE, confband = TRUE)

# smaller significance level for the small risk that the number of
# change-points is overestimated with probability not more than 5%,
# but smaller detection power
stepFit(y, x = x, alpha = 0.05, jumpint = TRUE, confband = TRUE)
## No test: 
# different interval system, lengths, penalty and given parameter sd
stepFit(y, x = x, alpha = 0.5, intervalSystem = "dyaLen",
        lengths = c(1L, 2L, 4L, 8L), penalty = "weights",
        weights = c(0.4, 0.3, 0.2, 0.1), sd = 0.5,
        jumpint = TRUE, confband = TRUE)
## End(No test)        
# with given q
identical(stepFit(y, x = x, q = critVal(100L, alpha = 0.5),
                  jumpint = TRUE, confband = TRUE), fit)
identical(stepFit(y, x = x, q = critVal(100L, alpha = 0.5, output = "value"),
                  jumpint = TRUE, confband = TRUE), fit)
## No test: 
# the above calls saved and (attempted to) load Monte-Carlo simulations and
# simulated them for nq = 128 observations
# in the following call no saving, no loading and simulation for n = 100
# observations is required, progress of the simulation will be reported
stepFit(y, x = x, alpha = 0.5, jumpint = TRUE, confband = TRUE,
        messages = 1000L, options = list(simulation = "vector",
                                         load = list(), save = list()))

# with given stat to compute q
stat <- monteCarloSimulation(n = 128L)
identical(stepFit(y, x = x, alpha = 0.5, stat = stat,
                  jumpint = TRUE, confband = TRUE),
          stepFit(y, x = x, alpha = 0.5, jumpint = TRUE, confband = TRUE,
                  options = list(load = list())))
## End(No test)


