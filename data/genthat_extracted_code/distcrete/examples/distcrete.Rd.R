library(distcrete)


### Name: distcrete
### Title: Discretise a distribution
### Aliases: distcrete

### ** Examples

library(distcrete)
set.seed(415)
d0 <- distcrete("gamma", 1, shape = 3, w = 0)
d0$d(1:10)
d0$p(c(.1,.5))
d0$q(c(.1,.5))
d0$r(10)



