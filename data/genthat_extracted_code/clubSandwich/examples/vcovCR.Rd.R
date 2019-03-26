library(clubSandwich)


### Name: vcovCR
### Title: Cluster-robust variance-covariance matrix
### Aliases: vcovCR vcovCR.default

### ** Examples


# simulate design with cluster-dependence
m <- 8
cluster <- factor(rep(LETTERS[1:m], 3 + rpois(m, 5)))
n <- length(cluster)
X <- matrix(rnorm(3 * n), n, 3)
nu <- rnorm(m)[cluster]
e <- rnorm(n)
y <- X %*% c(.4, .3, -.3) + nu + e
dat <- data.frame(y, X, cluster, row = 1:n)

# fit linear model
lm_fit <- lm(y ~ X1 + X2 + X3, data = dat)
vcov(lm_fit)

# cluster-robust variance estimator with CR2 small-sample correction
vcovCR(lm_fit, cluster = dat$cluster, type = "CR2")

# compare small-sample adjustments
CR_types <- paste0("CR",c("0","1","1S","2","3"))
sapply(CR_types, function(type) 
       sqrt(diag(vcovCR(lm_fit, cluster = dat$cluster, type = type))))




