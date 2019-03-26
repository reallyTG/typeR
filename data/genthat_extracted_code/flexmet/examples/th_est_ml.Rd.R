library(flexmet)


### Name: th_est_ml
### Title: Latent Trait Estimation
### Aliases: th_est_ml th_est_eap

### ** Examples


set.seed(3453)
bmat <- sim_bmat(n_items = 20, k = 0)$bmat

theta <- rnorm(10)
dat <- sim_data(bmat = bmat, theta = theta)

## mle estimates
mles <- th_est_ml(dat = dat, bmat = bmat)

## eap estimates
eaps <- th_est_eap(dat = dat, bmat = bmat)

cor(mles[,1], eaps[,1])
# 0.9967317




