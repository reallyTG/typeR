library(SEL)


### Name: quantSEL
### Title: Calculate quantiles of an SEL object.
### Aliases: quantSEL
### Keywords: misc

### ** Examples

## example from O'Hagan et al. (2006)
x <- c(177.5, 183.75, 190, 205, 220)
y <- c(0.175, 0.33, 0.5, 0.75, 0.95)

default   <- SEL(x, y, Delta = 0.05, bounds = c(165, 250))
bernst    <- SEL(x, y, d = 10, N = 0, Delta = 0.05, bounds = c(165, 250))
unifknots <- SEL(x, y, d = 3, N = 5, Delta = 0.05, bounds = c(165, 250))
lin       <- SEL(x, y, d = 1, inknts = x, Delta = 0.05, bounds = c(165,250))
quantSEL(c(0.25, 0.5, 0.75), default)
quantSEL(c(0.25, 0.5, 0.75), bernst)
quantSEL(c(0.25, 0.5, 0.75), unifknots)
quantSEL(c(0.25, 0.5, 0.75), lin)



