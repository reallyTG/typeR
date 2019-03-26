library(stepR)


### Name: stepR-package
### Title: Multiscale Change-Point Inference
### Aliases: stepR-package stepR
### Keywords: package,nonparametric

### ** Examples

# generate random observations
set.seed(1)
n <- 100L
x <- seq(1 / n, 1, 1 / n)
mu <- stepfit(cost = 0, family = "gauss", value = c(0, 3, 0, -2, 0), param = NULL,
              leftEnd = x[c(1, 21, 26, 71, 81)],
              rightEnd = x[c(20, 25, 70, 80, 100)], x0 = 0,
              leftIndex = c(1, 21, 26, 71, 81),
              rightIndex = c(20, 25, 70, 80, 100))
sigma0 <- 0.5
epsilon <- rnorm(n, 0, sigma0)
y <- fitted(mu) + epsilon
plot(x, y, pch = 16, col = "grey30", ylim = c(-3, 4))
lines(mu, lwd = 3)

# computation of SMUCE and its confidence statements
fit <- stepFit(y, x = x, alpha = 0.5, jumpint = TRUE, confband = TRUE)
lines(fit, lwd = 3, col = "red", lty = "22")

# confidence intervals for the change-point locations
points(jumpint(fit), col = "red", lwd = 3)
# confidence band
lines(confband(fit), lty = "22", col = "darkred", lwd = 2)

# higher significance level for larger detection power, but less confidence
# suggested for screening purposes
stepFit(y, x = x, alpha = 0.9, jumpint = TRUE, confband = TRUE)

# smaller significance level for the small risk that the number of
# change-points is overestimated with probability not more than 5%,
# but smaller detection power
stepFit(y, x = x, alpha = 0.05, jumpint = TRUE, confband = TRUE)
## No test: 
# different interval system, lengths, penalty and given parameter sd
stepFit(y, x = x, alpha = 0.5, intervalSystem = "dyaLen",
        lengths = c(1L, 2L, 4L, 8L), penalty = "weights",
        weights = c(0.4, 0.3, 0.2, 0.1), sd = sigma0,
        jumpint = TRUE, confband = TRUE)

# the above calls saved and (attempted to) load Monte-Carlo simulations and
# simulated them for nq = 128 observations
# in the following call no saving, no loading and simulation for n = 100
# observations is required, progress of the simulation will be reported
stepFit(y, x = x, alpha = 0.5, jumpint = TRUE, confband = TRUE, messages = 1000L,
        options = list(simulation = "vector", load = list(), save = list()))
## End(No test)
# critVal was called in stepFit, can be called explicitly,
# for instance outside of a for loop to save computation time
qVector <- critVal(100L, alpha = 0.5)
identical(stepFit(y, x = x, q = qVector, jumpint = TRUE, confband = TRUE), fit)

qValue <- critVal(100L, alpha = 0.5, output = "value")
identical(stepFit(y, x = x, q = qValue, jumpint = TRUE, confband = TRUE), fit)

# computeBounds gives the multiscale contraint
computeBounds(y, alpha = 0.5)
## No test: 
# monteCarloSimulation will be called in critVal if required
# can be called explicitly
stat <- monteCarloSimulation(n = 100L)
identical(critVal(n = 100L, alpha = 0.5, stat = stat),
          critVal(n = 100L, alpha = 0.5,
                  options = list(load = list(), simulation = "vector")))
identical(critVal(n = 100L, alpha = 0.5, stat = stat, output = "value"),
          critVal(n = 100L, alpha = 0.5, output = "value",
                  options = list(load = list(), simulation = "vector")))

stat <- monteCarloSimulation(n = 100L, output = "maximum")
identical(critVal(n = 100L, alpha = 0.5, stat = stat),
          critVal(n = 100L, alpha = 0.5,
                  options = list(load = list(), simulation = "vector")))
identical(critVal(n = 100L, alpha = 0.5, stat = stat, output = "value"),
          critVal(n = 100L, alpha = 0.5, output = "value",
                  options = list(load = list(), simulation = "vector")))
## End(No test)                  
# fit satisfies the multiscale contraint, i.e.
# the computed penalized multiscale statistic is not larger than the global quantile
computeStat(y, signal = fit, output = "maximum") <= qValue
# multiscale vector of statistics is componentwise not larger than 
# the vector of critical values
all(computeStat(y, signal = fit, output = "vector") <= qVector)

## No test: 
# family "hsmuce"
set.seed(1)
y <- c(rnorm(50, 0, 1), rnorm(50, 1, 0.2))
plot(x, y, pch = 16, col = "grey30", ylim = c(-2.5, 2))

# computation of HSMUCE and its confidence statements
fit <- stepFit(y, x = x, alpha = 0.5, family = "hsmuce",
               jumpint = TRUE, confband = TRUE)
lines(fit, lwd = 3, col = "red", lty = "22")

# confidence intervals for the change-point locations
points(jumpint(fit), col = "red", lwd = 3)
# confidence band
lines(confband(fit), lty = "22", col = "darkred", lwd = 2)

# for comparison SMUCE, not recommend to use here
lines(stepFit(y, x = x, alpha = 0.5,
              jumpint = TRUE, confband = TRUE),
      lwd = 3, col = "blue", lty = "22")


# family "mDependentPS"
# generate observations from a moving average process
set.seed(1)
y <- c(rep(0, 50), rep(2, 50)) +
  as.numeric(arima.sim(n = 100, list(ar = c(), ma = c(0.8, 0.5, 0.3)), sd = sigma0))
correlations <- as.numeric(ARMAacf(ar = c(), ma = c(0.8, 0.5, 0.3), lag.max = 3))
covariances <- sigma0^2 * correlations
plot(x, y, pch = 16, col = "grey30", ylim = c(-2, 4))

# computation of SMUCE for dependent observations with given covariances
fit <- stepFit(y, x = x, alpha = 0.5, family = "mDependentPS",
               covariances = covariances, jumpint = TRUE, confband = TRUE)
lines(fit, lwd = 3, col = "red", lty = "22")

# confidence intervals for the change-point locations
points(jumpint(fit), col = "red", lwd = 3)
# confidence band
lines(confband(fit), lty = "22", col = "darkred", lwd = 2)

# for comparison SMUCE for independent observations, not recommend to use here
lines(stepFit(y, x = x, alpha = 0.5,
              jumpint = TRUE, confband = TRUE),
      lwd = 3, col = "blue", lty = "22")

# with given correlations, standard deviation will be estimated by sdrobnorm
stepFit(y, x = x, alpha = 0.5, family = "mDependentPS",
        correlations = correlations, jumpint = TRUE, confband = TRUE)
        
        
# examples from version 1.0-0
# estimating step-functions with Gaussian white noise added
# simulate a Gaussian hidden Markov model of length 1000 with 2 states
# with identical transition rates 0.01, and signal-to-noise ratio 2
sim <- contMC(1e3, 0:1, matrix(c(0, 0.01, 0.01, 0), 2), param=1/2)
plot(sim$data, cex = 0.1)
lines(sim$cont, col="red")
# maximum-likelihood estimation under multiresolution constraints
fit.MRC <- smuceR(sim$data$y, sim$data$x)
lines(fit.MRC, col="blue")
# choose number of jumps using BIC
path <- steppath(sim$data$y, sim$data$x, max.blocks=1e2)
fit.BIC <- path[[stepsel.BIC(path)]]
lines(fit.BIC, col="green3", lty = 2)

# estimate after filtering
# simulate filtered ion channel recording with two states
set.seed(9)
# sampling rate 10 kHz
sampling <- 1e4
# tenfold oversampling
over <- 10
# 1 kHz 4-pole Bessel-filter, adjusted for oversampling
cutoff <- 1e3
df.over <- dfilter("bessel", list(pole=4, cutoff=cutoff / sampling / over))
# two states, leaving state 1 at 10 Hz, state 2 at 20 Hz
rates <- rbind(c(0, 10), c(20, 0))
# simulate 0.5 s, level 0 corresponds to state 1, level 1 to state 2
# noise level is 0.3 after filtering
Sim <- contMC(0.5 * sampling, 0:1, rates, sampling=sampling, family="gaussKern",
  param = list(df=df.over, over=over, sd=0.3))
plot(Sim$data, pch = ".")
lines(Sim$discr, col = "red")
# fit under multiresolution constraints using filter corresponding to sample rate
df <- dfilter("bessel", list(pole=4, cutoff=cutoff / sampling))
Fit.MRC <- jsmurf(Sim$data$y, Sim$data$x, param=df, r=1e2)
lines(Fit.MRC, col = "blue")
# fit using TRANSIT
Fit.trans <- transit(Sim$data$y, Sim$data$x)
lines(Fit.trans, col = "green3", lty=2)
## End(No test)


