library(actuar)


### Name: aggregateDist
### Title: Aggregate Claim Amount Distribution
### Aliases: aggregateDist print.aggregateDist plot.aggregateDist
###   summary.aggregateDist mean.aggregateDist diff.aggregateDist
### Keywords: distribution models

### ** Examples

## Convolution method (example 9.5 of Klugman et al. (2012))
fx <- c(0, 0.15, 0.2, 0.25, 0.125, 0.075,
        0.05, 0.05, 0.05, 0.025, 0.025)
pn <- c(0.05, 0.1, 0.15, 0.2, 0.25, 0.15, 0.06, 0.03, 0.01)
Fs <- aggregateDist("convolution", model.freq = pn,
                    model.sev = fx, x.scale = 25)
summary(Fs)
c(Fs(0), diff(Fs(25 * 0:21))) # probability mass function
plot(Fs)

## Recursive method (example 9.10 of Klugman et al. (2012))
fx <- c(0, crossprod(c(2, 1)/3,
                     matrix(c(0.6, 0.7, 0.4, 0, 0, 0.3), 2, 3)))
Fs <- aggregateDist("recursive", model.freq = "poisson",
                    model.sev = fx, lambda = 3)
plot(Fs)
Fs(knots(Fs))		      # cdf evaluated at its knots
diff(Fs)                      # probability mass function

## Recursive method (high frequency)
fx <- c(0, 0.15, 0.2, 0.25, 0.125, 0.075,
        0.05, 0.05, 0.05, 0.025, 0.025)
## Not run: 
##D Fs <- aggregateDist("recursive", model.freq = "poisson",
##D                     model.sev = fx, lambda = 1000)
## End(Not run)
Fs <- aggregateDist("recursive", model.freq = "poisson",
                    model.sev = fx, lambda = 250, convolve = 2, maxit = 1500)
plot(Fs)

## Recursive method (zero-modified distribution; example 9.11 of
## Klugman et al. (2012))
Fn <- aggregateDist("recursive", model.freq = "binomial",
                    model.sev = c(0.3, 0.5, 0.2), x.scale = 50,
                    p0 = 0.4, size = 3, prob = 0.3)
diff(Fn)

## Equivalent but more explicit call
aggregateDist("recursive", model.freq = "zero-modified binomial",
              model.sev = c(0.3, 0.5, 0.2), x.scale = 50,
              p0 = 0.4, size = 3, prob = 0.3)

## Recursive method (zero-truncated distribution). Using 'fx' above
## would mean that both Pr[N = 0] = 0 and Pr[X = 0] = 0, therefore
## Pr[S = 0] = 0 and recursions would not start.
fx <- discretize(pexp(x, 1), from = 0, to = 100, method = "upper")
fx[1L] # non zero
aggregateDist("recursive", model.freq = "zero-truncated poisson",
              model.sev = fx, lambda = 3, x.scale = 25, echo=TRUE)

## Normal Power approximation
Fs <- aggregateDist("npower", moments = c(200, 200, 0.5))
Fs(210)

## Simulation method
model.freq <- expression(data = rpois(3))
model.sev <- expression(data = rgamma(100, 2))
Fs <- aggregateDist("simulation", nb.simul = 1000,
                    model.freq, model.sev)
mean(Fs)
plot(Fs)

## Evaluation of ruin probabilities using Beekman's formula with
## Exponential(1) claim severity, Poisson(1) frequency and premium rate
## c = 1.2.
fx <- discretize(pexp(x, 1), from = 0, to = 100, method = "lower")
phi0 <- 0.2/1.2
Fs <- aggregateDist(method = "recursive", model.freq = "geometric",
                    model.sev = fx, prob = phi0)
1 - Fs(400)			# approximate ruin probability
u <- 0:100
plot(u, 1 - Fs(u), type = "l", main = "Ruin probability")



