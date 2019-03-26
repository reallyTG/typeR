library(catIrt)


### Name: KL
### Title: Calculate Kullback-Leibler Divergence for IRT Models
### Aliases: KL KL.brm KL.grm

### ** Examples

#########################
# Binary Response Model #
#########################

## 1 ##
set.seed(888)
# generating random theta:
theta <- rnorm(20)
# generating an item bank under a 3-parameter binary response model:
b.params <- cbind(a = runif(100, .5, 1.5), b = rnorm(100, 0, 2), c = .2)

# you can indicate class of params or extract it from simIrt object:
class(b.params) <- "brm"

# calculating KL information with delta = .1:
k.info1 <- KL(params = b.params, theta = theta, delt = .1)
# changing delta to .2
k.info2 <- KL(params = b.params, theta = theta, delt = .2)

# notice how the overall information has increased when increasing delt:
k.info1$test; k.info2$test

# also compare with Fisher information:
f.info <- FI(params = b.params, theta = theta, type = "expected")

k.info2$test; f.info$test

# Fisher information is much higher because of how it weighs things.

## 2 ##
# we can maximize information at a boundary - say "0":
k.info3 <- KL(params = b.params, theta = 0, delta = .1)
b.params[which.max(k.info3$item), ]

# notice how the a parameter is high while the b parameter is close to
# 0, so item selection is working.

# does Fisher information choose a different item?
f.info2 <- FI(params = b.params, theta = 0, type = "expected")
b.params[which.max(f.info2$item), ]

# nope - although with more items, who knows?


#########################
# Graded Response Model #
#########################

## 1 ##
set.seed(999)
# generating random theta
theta <- rnorm(20)
# generating an item bank under a graded response model:
g.params <- cbind(runif(100, .5, 1.5), rnorm(100), rnorm(100),
                                       rnorm(100), rnorm(100), rnorm(100))
# simulating responses (so that the parameters are ordered - see simIrt)
g.params <- simIrt(theta = theta, params = g.params, mod = "grm")$params[ , -1]

# we can calculate KL information as before, noting that class(g.params) is "grm"
class(g.params)     # so we don't need to set it ourselves

# and now KL info with delt = .1
k.info4 <- KL(theta = theta, params = g.params)

# KL information is higher when more boundaries
k.info4$test
k.info1$test

# Note: k.info1 would be exactly the same if calculated with the "grm"
#       rather than the "brm"

## 2 ##
# we can also maximize information at boundary "0"
k.info5 <- KL(params = g.params, theta = 0, delta = .1)
g.params[which.max(k.info5$item), ]

# notice how the a parameter is high while the b parameters are pretty spread out.

# does Fisher information choose a different item?
f.info3 <- FI(params = g.params, theta = 0, type = "expected")
g.params[which.max(f.info3$item), ]

# nope - although with more items, who knows?



