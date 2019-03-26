library(qrmtools)


### Name: pp_qq_plot
### Title: P-P and Q-Q Plots
### Aliases: pp_plot qq_plot
### Keywords: hplot

### ** Examples

## Generate data
n <- 1000
mu <- 1
sig <- 3
nu <- 3.5
set.seed(271) # set seed
x <- mu + sig * sqrt((nu-2)/nu) * rt(n, df = nu) # sample from t_nu(mu, sig^2)

## P-P plot
pF <- function(q) pt((q - mu) / (sig * sqrt((nu-2)/nu)), df = nu)
pp_plot(x, FUN = pF)

## Q-Q plot
qF <- function(p) mu + sig * sqrt((nu-2)/nu) * qt(p, df = nu)
qq_plot(x, FUN = qF)

## A comparison with R's qqplot() and qqline()
qqplot(qF(ppoints(length(x))), x) # the same (except labels)
qqline(x, distribution = qF) # slightly different (since *estimated*)

## Difference of the two methods
set.seed(271)
z <- rnorm(1000)
## Standardized data
qq_plot(z, FUN = qnorm) # fine
qq_plot(z, FUN = qnorm, method = "empirical") # fine
## Location-scale transformed data
mu <- 3
sig <- 2
z. <- mu+sig*z
qq_plot(z., FUN = qnorm) # not fine (z. comes from N(mu, sig^2), not N(0,1))
qq_plot(z., FUN = qnorm, method = "empirical") # fine (as intercept and slope are estimated)



