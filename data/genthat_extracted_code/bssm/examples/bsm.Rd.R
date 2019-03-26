library(bssm)


### Name: bsm
### Title: Basic Structural (Time Series) Model
### Aliases: bsm

### ** Examples


prior <- uniform(0.1 * sd(log10(UKgas)), 0, 1)
model <- bsm(log10(UKgas), sd_y = prior, sd_level =  prior,
  sd_slope =  prior, sd_seasonal =  prior)

mcmc_out <- run_mcmc(model, n_iter = 5000)
summary(expand_sample(mcmc_out, "theta"))$stat
mcmc_out$theta[which.max(mcmc_out$posterior), ]
sqrt((fit <- StructTS(log10(UKgas), type = "BSM"))$coef)[c(4, 1:3)]




