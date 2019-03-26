library(portes)


### Name: fitstable
### Title: Fit Parameters to Stable Distributions, McCulloch (1986)
### Aliases: fitstable
### Keywords: Distribution

### ** Examples

## Univariate
x <- rStable(800, 1.7, 0, 1, 0)
fitstable(x)
## Multivariate
ALPHA <- c(1.3,1.6)
BETA <- c(0,0.2)
GAMMA <-c(1,1)
DELTA <-c(0,0.2)
x <- rStable(500, ALPHA, BETA, GAMMA, DELTA)
fitstable(x)



