library(btergm)


### Name: simulate.btergm
### Title: Simulate new networks from btergm objects
### Aliases: simulate.btergm

### ** Examples

# fit a TERGM to some toy data
library("network")
set.seed(5)
networks <- list()
for(i in 1:10){            # create 10 random networks with 10 actors
  mat <- matrix(rbinom(100, 1, .25), nrow = 10, ncol = 10)
  diag(mat) <- 0           # loops are excluded
  nw <- network(mat)       # create network object
  networks[[i]] <- nw      # add network to the list
}
covariates <- list()
for (i in 1:10) {          # create 10 matrices as covariate
  mat <- matrix(rnorm(100), nrow = 10, ncol = 10)
  covariates[[i]] <- mat   # add matrix to the list
}
fit <- btergm(networks ~ edges + istar(2) +
    edgecov(covariates), R = 100)

# simulate 12 new networks from the last (= 10th) time step
sim1 <- simulate(fit, nsim = 12)

# simulate 1 network from the first time step
sim2 <- simulate(fit, index = 1)

# simulate network from t = 5 with larger covariate coefficient
coefs <- coef(fit)
coefs["edgecov.covariates[[i]]"] <- 0.5
sim3 <- simulate(fit, index = 5, coef = coefs)



