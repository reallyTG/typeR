library(ordinal)


### Name: lgamma
### Title: The log-gamma distribution
### Aliases: plgamma dlgamma glgamma
### Keywords: distribution

### ** Examples


## Illustrating the link to other distribution functions: 
x <- -5:5
plgamma(x, lambda = 0) == pnorm(x)
all.equal(plgamma(x, lambda = -1), pgumbel(x)) ## TRUE, but:
plgamma(x, lambda = -1) == pgumbel(x)
plgamma(x, lambda = 1) == pgumbel(x, max = FALSE)

dlgamma(x, lambda = 0) == dnorm(x)
dlgamma(x, lambda = -1) == dgumbel(x)
dlgamma(x, lambda = 1) == dgumbel(x, max = FALSE)

glgamma(x, lambda = 0) == gnorm(x)
all.equal(glgamma(x, lambda = -1), ggumbel(x)) ## TRUE, but:
glgamma(x, lambda = -1) == ggumbel(x)
all.equal(glgamma(x, lambda = 1), ggumbel(x, max = FALSE)) ## TRUE, but:
glgamma(x, lambda = 1) == ggumbel(x, max = FALSE)
## There is a loss of accuracy, but the difference is very small: 
glgamma(x, lambda = 1) - ggumbel(x, max = FALSE)

## More examples:
x <- -5:5
plgamma(x, lambda = .5)
dlgamma(x, lambda = .5)
glgamma(x, lambda = .5)




