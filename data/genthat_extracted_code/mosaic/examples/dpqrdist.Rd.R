library(mosaic)


### Name: dpqrdist
### Title: Distribution wrapper
### Aliases: dpqrdist

### ** Examples

# 3 random draws from N(1,2)
dpqrdist("norm", "r", n = 3, mean = 1, sd = 2)
# These should all be the same
dpqrdist("norm", "d", x = 0) == dnorm(x = 0)
dpqrdist("norm", "p", q = 0, mean = 1, sd = 2) == pnorm(q = 0, mean = 1, sd = 2)
dpqrdist("norm", "q", p = 0.5, mean = 1, sd = 2) == qnorm(p = 0.5, mean = 1, sd = 2)




