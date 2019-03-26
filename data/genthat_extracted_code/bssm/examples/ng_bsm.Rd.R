library(bssm)


### Name: ng_bsm
### Title: Non-Gaussian Basic Structural (Time Series) Model
### Aliases: ng_bsm

### ** Examples

model <- ng_bsm(Seatbelts[, "VanKilled"], distribution = "poisson",
  sd_level = halfnormal(0.01, 1),
  sd_seasonal = halfnormal(0.01, 1),
  beta = normal(0, 0, 10),
  xreg = Seatbelts[, "law"])
## Not run: 
##D set.seed(123)
##D mcmc_out <- run_mcmc(model, n_iter = 5000, nsim = 10)
##D mcmc_out$acceptance_rate
##D theta <- expand_sample(mcmc_out, "theta")
##D plot(theta)
##D summary(theta)
##D 
##D library("ggplot2")
##D ggplot(as.data.frame(theta[,1:2]), aes(x = sd_level, y = sd_seasonal)) +
##D   geom_point() + stat_density2d(aes(fill = ..level.., alpha = ..level..),
##D   geom = "polygon") + scale_fill_continuous(low = "green",high = "blue") +
##D   guides(alpha = "none")
##D 
## End(Not run)



