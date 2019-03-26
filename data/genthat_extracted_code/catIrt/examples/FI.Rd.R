library(catIrt)


### Name: FI
### Title: Calculate Expected and Observed Fisher Information for IRT
###   Models
### Aliases: FI FI.brm FI.grm

### ** Examples

#########################
# Binary Response Model #
#########################

## 1 ##
set.seed(888)
# generating random theta:
theta <- rnorm(20)
# generating an item bank under a 2-parameter binary response model:
b.params <- cbind(a = runif(100, .5, 1.5), b = rnorm(100, 0, 2), c = 0)
# simulating responses using random theta:
b.mod <- simIrt(params = b.params, theta = theta, mod = "brm")

# you can indicate class of params or extract it from simIrt object:
class(b.params) <- "brm"

# calculating expected and observed information:
e.info <- FI(params = b.params, theta = theta, type = "expected")
o.info <- FI(params = b.params, theta = theta, type = "observed", resp = b.mod$resp)

# 2-parameter model, so e.info will be equal to o.info:
all(signif(e.info$item) == signif(o.info$item))


## 2 ##
# generating an item bank under a 3-parameter binary response model:
b.params2 <- cbind(a = runif(100, .5, 1.5), b = rnorm(100, 0, 2), c = .2)
# simulating responses using pre-specified thetas:
b.mod2 <- simIrt(params = b.params2, mod = "brm")

# calculating expected and observed information:
# (if you don't indicate class, you can extract from simIrt object)
e.info2 <- FI(params = b.params2, theta = b.mod2$theta, type = "expected")
o.info2 <- FI(params = b.params2, theta = b.mod2$theta, type = "observed",
                                  resp = b.mod2$resp)

# 3-parameter model, so e.info will not be equal to o.info:
all(signif(e.info2$item) == signif(o.info2$item))


## 3 ##
# if theta is a scalar, item will be a vector and test will be a scalar:
e.info3 <- FI(params = b.params2, theta = 0, type = "expected")
dim(e.info3$item)       # no dimension because it's a vector
length(e.info3$item)    # of length equal to the number of items

# if params is a vector, item will be a matrix with one row:
e.info4 <- FI(params = c(1, 2, 0), theta = c(1, 2), type = "expected")
dim(e.info4$item)

# if you don't class params, FI will assume a binary response model.


#########################
# Graded Response Model #
#########################
set.seed(999)
# generating random theta
theta <- rnorm(10)
# generating an item bank under a graded response model:
g.params <- cbind(a = runif(30, .5, 1.5), b1 = rnorm(30), b2 = rnorm(30),
                                          b3 = rnorm(30), b4 = rnorm(30))
# you can sort the parameters yourself:
g.params <- cbind(g.params[ , 1],
                  t(apply(g.params[ ,2:dim(g.params)[2]], MARGIN = 1,
                                                          FUN = sort)))
# simulating responses using random theta:
g.mod <- simIrt(params = g.params, theta = theta, mod = "grm")

# calculating expected and observed information:
class(g.params) <- "grm"   # always indicate model or extract from simulation.
e.info5 <- FI(params = g.params, theta = theta, type = "expected")
o.info5 <- FI(params = g.params, theta = theta, type = "observed", resp = g.mod$resp)

# grm, so e.info will not be equal to o.info:
all(signif(e.info5$item) == signif(o.info5$item))

# if thet is a vector and params is a vector, item will be a J x N matrix:
dim(e.info5$item)

# if you don't want to sort the parameters, you can extract from simIrt object:
e.info6 <- FI(params = g.mod$params[ , -1], theta = g.mod$theta, type = "expected")

# but you first need to remove column 1 (the item number column).



