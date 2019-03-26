library(MultiGHQuad)


### Name: eval.quad
### Title: Evaluation of multivariate normal distributed expectations
### Aliases: eval.quad

### ** Examples

### Basic example; E(X), X ~ N(0,1)
grid <- init.quad(Q = 1, prior = list(mu = 0, Sigma = diag(1)))
eval.quad(X = grid)

### Example; Rasch model person parameter
# E(theta), theta ~ N(0,1) * P(X = 1 | theta, beta), P is simplified rasch model
# set up rasch model with fixed beta, returns LL
rasch <- function(theta, beta, responses){
  p <- exp(theta - beta)/(1 + exp(theta - beta))
  q <- 1 - p
  return(log(p) * sum(responses == 1) + log(q) * sum(responses == 0))
}

# when theta == beta, P(X = 1) = .5, generate some bernoulli trials with p = .5
responses <- rbinom(5, 1, .5)

# get EAP estimate for theta, prior N(0,1)
eval.quad(rasch, grid, beta = 0, responses = responses)

# with more data, the estimate becomes more accurate, and variance decreases
eval.quad(rasch, grid, beta = 0, responses = rbinom(20, 1, .5))
eval.quad(rasch, grid, beta = 0, responses = rbinom(50, 1, .5))
eval.quad(rasch, grid, beta = 0, responses = rbinom(100, 1, .5))

### problem; the result starts to 'snap' to the closest quadrature point when
# the posterior distribution is too dissimilar to the prior.
evals <- eval.quad(rasch, grid, beta = 0, responses = rbinom(100, 1, .5), debug = TRUE)
evals.values <- attr(evals, "values")

# posterior density after 40 items
p <- plot(function(x) exp(dnorm(x, log = TRUE) + 
                            rasch(x, beta = 1, responses = rbinom(100, 1, .5))),
          from = -3, to = 3)

# quadrature points used
points(grid$X, exp(grid$W)*max(p$y), pch = 20)

# the evaluation relies almost completely on one quadrature point, 
# which causes results to 'snap' to that point.
# we could add more quadrature points...
grid2 <- init.quad(Q = 1, ip = 20)
points(grid2$X, exp(grid2$W)*max(p$y), pch = 20, col = "grey")

# but if the posterior is not centered on the prior, this quickly fails:
p <- plot(function(x) exp(dnorm(x, log = TRUE) + 
                            rasch(x, beta = 2, responses = rbinom(100, 1, .5))),
          from = -3, to = 3)
points(grid2$X, exp(grid2$W)*max(p$y), pch = 20, col = "grey")

# additionally, adding extra quadrature points in a multidimensional 
# problem quickly grows out of control.

### a better solution; adaptive quadrature grid.
# say we have an idea of where our parameter is located, through another estimator, 
# or a previous estimate.
# we can then use this to adapt where our quadrature grid should be.
# get an estimate;
responses <- rbinom(10, 1, .5)
est <- eval.quad(rasch, grid, beta = 2, responses = responses)
print( est )

# adapt the grid;
grid3 <- init.quad(Q = 1, adapt = est)

# grid is now much closer to posterior 
p <- plot(function(x) exp(dnorm(x, log = TRUE) + 
                            rasch(x, beta = 2, responses = rep(c(0,1), each = 20))),
          from = -3, to = 3)
points(grid3$X, exp(grid3$W)*max(p$y), pch = 20, col = "grey")
est <- eval.quad(rasch, grid3, beta = 2, responses = responses)
print(est)



