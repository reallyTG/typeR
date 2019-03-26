library(estimatr)


### Name: lm_lin
### Title: Linear regression with the Lin (2013) covariate adjustment
### Aliases: lm_lin

### ** Examples

library(fabricatr)
library(randomizr)
dat <- fabricate(
  N = 40,
  x = rnorm(N, mean = 2.3),
  x2 = rpois(N, lambda = 2),
  x3 = runif(N),
  y0 = rnorm(N) + x,
  y1 = rnorm(N) + x + 0.35
)

dat$z <- complete_ra(N = nrow(dat))
dat$y <- ifelse(dat$z == 1, dat$y1, dat$y0)

# Same specification as lm_robust() with one additional argument
lmlin_out <- lm_lin(y ~ z, covariates = ~ x, data = dat)
tidy(lmlin_out)

# Works with multiple pre-treatment covariates
lm_lin(y ~ z, covariates = ~ x + x2, data = dat)

# Also centers data AFTER evaluating any functions in formula
lmlin_out2 <- lm_lin(y ~ z, covariates = ~ x + log(x3), data = dat)
lmlin_out2$scaled_center["log(x3)"]
mean(log(dat$x3))

# Works easily with clusters
dat$clusterID <- rep(1:20, each = 2)
dat$z_clust <- cluster_ra(clusters = dat$clusterID)

lm_lin(y ~ z_clust, covariates = ~ x, data = dat, clusters = clusterID)

# Works with multi-valued treatments
dat$z_multi <- sample(1:3, size = nrow(dat), replace = TRUE)
lm_lin(y ~ z_multi, covariates = ~ x, data = dat)

# Stratified estimator with blocks
dat$blockID <- rep(1:5, each = 8)
dat$z_block <- block_ra(blocks = dat$blockID)

lm_lin(y ~ z_block, ~ factor(blockID), data = dat)

## Not run: 
##D   # Can also use 'margins' package if you have it installed to get
##D   # marginal effects
##D   library(margins)
##D   lmlout <- lm_lin(y ~ z_block, ~ x, data = dat)
##D   summary(margins(lmlout))
##D 
##D   # Can output results using 'texreg'
##D   library(texreg)
##D   texregobj <- extract(lmlout)
## End(Not run)




