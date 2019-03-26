library(kde1d)


### Name: kde1d
### Title: Univariate local-polynomial likelihood kernel density estimation
### Aliases: kde1d

### ** Examples


## unbounded data
x <- rnorm(500)                    # simulate data
fit <- kde1d(x)                    # estimate density
dkde1d(0, fit)                     # evaluate density estimate
summary(fit)                       # information about the estimate
plot(fit)                          # plot the density estimate
curve(dnorm(x), add = TRUE,        # add true density
      col = "red")

## bounded data, log-linear
x <- rgamma(500, shape = 1)        # simulate data
fit <- kde1d(x, xmin = 0, deg = 1) # estimate density
dkde1d(seq(0, 5, by = 1), fit)     # evaluate density estimate
summary(fit)                       # information about the estimate
plot(fit)                          # plot the density estimate
curve(dgamma(x, shape = 1),        # add true density
      add = TRUE, col = "red",
      from = 1e-3)

## discrete data
x <- rbinom(500, size = 5, prob = 0.5)  # simulate data
x <- ordered(x, levels = 0:5)           # declare as ordered
fit <- kde1d(x)                         # estimate density
dkde1d(sort(unique(x)), fit)            # evaluate density estimate
summary(fit)                            # information about the estimate
plot(fit)                               # plot the density estimate
points(ordered(0:5, 0:5),               # add true density
       dbinom(0:5, 5, 0.5), col = "red")




