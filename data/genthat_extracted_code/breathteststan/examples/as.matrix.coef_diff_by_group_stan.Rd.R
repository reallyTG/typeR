library(breathteststan)


### Name: as.matrix.coef_diff_by_group_stan
### Title: S3 as.matrix for result of coef_diff_by_group
### Aliases: as.matrix.coef_diff_by_group_stan

### ** Examples

## No test: 
library(dplyr)
library(breathtestcore)
library(ggplot2)
data("usz_13c", package = "breathtestcore")
data = usz_13c %>%
  dplyr::filter( patient_id %in%  c("norm_001", "norm_002", "norm_003",
                        "norm_004", "pat_001", "pat_002","pat_003")) %>%
  cleanup_data()
fit = stan_group_fit(data, iter = 300, chains = 1)
cf = coef_diff_by_group(fit)
str(cf)
# Calling without parameters gives Maes/Ghoos t50
bayesplot::mcmc_hist(as.matrix(cf))
# Use a function from the bayesplot universe
dens = bayesplot::mcmc_dens(as.matrix(cf, parameter = "m"))
# use suppressMessages to avoid a message "another scale"
suppressMessages(
  dens + geom_vline(xintercept = 0) + scale_x_continuous(limits= c(-20,10)))
## End(No test)



