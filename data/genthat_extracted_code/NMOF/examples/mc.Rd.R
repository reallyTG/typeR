library(NMOF)


### Name: mc
### Title: Option Pricing via Monte-Carlo Simulation
### Aliases: mc gbm gbb

### ** Examples

## price a European option
## ... parameters
npaths <- 5000   ## increase number to get more precise results
timesteps <- 1
S0   <- 100
ST   <- 100
tau  <- 1
r <- 0.01
v   <- 0.25^2

## ... create paths
paths <- gbm(npaths, timesteps, r, v, tau, S0 = S0)

## ... a helper function
mc <- function(paths, payoff, ...)
    payoff(paths, ...)

## ... a payoff function (European call)
payoff <- function(paths, X, r, tau)
    exp(-r * tau) * mean(pmax(paths[NROW(paths), ] - X, 0))

## ... compute and check
mc(paths, payoff, X = 100, r = r, tau = tau)
vanillaOptionEuropean(S0, X = 100, tau = tau, r = r, v = v)$value


## compute delta via forward difference
## (see Gilli/Maringer/Schumann, ch. 9) 
h <- 1e-6                 ## a small number
rnorm(1)                  ## make sure RNG is initialised
rnd.seed <- .Random.seed  ## store current seed
paths1 <- gbm(npaths, timesteps, r, v, tau, S0 = S0)
.Random.seed <- rnd.seed
paths2 <- gbm(npaths, timesteps, r, v, tau, S0 = S0 + h)

delta.mc <- (mc(paths2, payoff, X = 100, r = r, tau = tau)- 
             mc(paths1, payoff, X = 100, r = r, tau = tau))/h
delta <- vanillaOptionEuropean(S0, X = 100, tau = tau,
                               r = r, v = v)$delta
delta.mc - delta 




## a fanplot
steps <- 100
paths <- results <- gbm(1000, steps, r = 0, v = 0.2^2,
                        tau = 1, S0 = 100)

levels <- seq(0.01, 0.49, length.out = 20)
greys  <- seq(0.9,  0.50, length.out = length(levels))

## start with an empty plot ...
plot(0:steps, rep(100, steps+1), ylim = range(paths),
     xlab = "", ylab = "", lty = 0, type = "l")

## ... and add polygons
for (level in levels) {

    l <- apply(paths, 1, quantile, level)
    u <- apply(paths, 1, quantile, 1 - level)
    col <- grey(greys[level == levels])
    polygon(c(0:steps, steps:0), c(l, rev(u)),
            col = col, border = NA)

    ## add border lines
    ## lines(0:steps, l, col = grey(0.4))
    ## lines(0:steps, u, col = grey(0.4))
}




