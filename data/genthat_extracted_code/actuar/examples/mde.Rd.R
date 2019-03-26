library(actuar)


### Name: mde
### Title: Minimum Distance Estimation
### Aliases: Mde mde
### Keywords: distribution htest

### ** Examples

## Individual data example
data(dental)
mde(dental, pexp, start = list(rate = 1/200), measure = "CvM")

## Example 2.21 of Klugman et al. (1998)
data(gdental)
mde(gdental, pexp, start = list(rate = 1/200), measure = "CvM")
mde(gdental, pexp, start = list(rate = 1/200), measure = "chi-square")
mde(gdental, levexp, start = list(rate = 1/200), measure = "LAS")

## Two-parameter distribution example
try(mde(gdental, ppareto, start = list(shape = 3, scale = 600),
        measure = "CvM")) # no convergence

## Working in log scale often solves the problem
pparetolog <- function(x, shape, scale)
    ppareto(x, exp(shape), exp(scale))

( p <- mde(gdental, pparetolog, start = list(shape = log(3),
           scale = log(600)), measure = "CvM") )
exp(p$estimate)



