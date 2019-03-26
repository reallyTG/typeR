library(revdbayes)


### Name: binpost
### Title: Random sampling from a binomial posterior distribution
### Aliases: binpost

### ** Examples

data(gom)
u <- quantile(gom, probs = 0.65)
ds_bin <- list()
ds_bin$n_raw <- length(gom)
ds_bin$m <- sum(gom > u)
bp <- set_bin_prior(prior = "jeffreys")
temp <- binpost(n = 1000, prior = bp, ds_bin = ds_bin)
graphics::hist(temp$bin_sim_vals, prob = TRUE)



