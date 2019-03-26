library(catIrt)


### Name: simIrt
### Title: Simulate Responses to IRT Models
### Aliases: simIrt

### ** Examples

#########################
# Binary Response Model #
#########################
set.seed(888)
# generating an item bank under a binary response model:
b.params <- cbind(a = runif(100, .5, 1.5), b = rnorm(100, 0, 2), c = .2)
# simulating responses using default theta:
b.mod <- simIrt(params = b.params, mod = "brm")

# same type of model without a guessing (c) parameter:
b.params2 <- cbind(a = runif(100, .5, 1.5), b = rnorm(100, 0, 2), c = 0)
b.mod2 <- simIrt(params = b.params2, mod = "brm")

# now generating a different theta:
theta <- rnorm(201)
b.mod3 <- simIrt(theta = theta, params = b.params2, mod = "brm")

# notice all of the responses are 0 or 1:
unique(as.vector(b.mod$resp))

# and the percentages (in general) increase as theta increases:
apply(b.mod$resp, 1, mean)    # theta = seq(-3, 3, by = 0.1)


#########################
# Graded Response Model #
#########################
set.seed(999)
# generating an item bank under a graded response model:
# (as many categories as your heart desires!)
g.params <- cbind(a = runif(10, .5, 1.5), b1 = rnorm(10), b2 = rnorm(10),
                                          b3 = rnorm(10))
# simulating responses using default theta (automatically sorts boundaries):
g.mod <- simIrt(params = g.params, mod = "grm")

# notice how the old parameters were not sorted:
g.params
# but the new parameters are sorted from column 2 on:
g.mod$params

# don't use these parameters with the binary response model:
try(simIrt(params = g.params, mod = "brm"), silent = TRUE)[1]

# a better parameter set for the graded response model:
g.params2 <- cbind(runif(100, .5, 1.5), b1 = runif(100, -2, -1), b2 = runif(100, -1, 0),
                                        b3 = runif(100, 0, 1), b4 = runif(100, 1, 2))
g.mod2 <- simIrt(params = g.params2, mod = "grm")

# notice all of the responses are positive integers:
unique(as.vector(g.mod$resp))
unique(as.vector(g.mod2$resp))

# and the responses (in general) increase as theta increases:
apply(g.mod2$resp, 1, mean)



