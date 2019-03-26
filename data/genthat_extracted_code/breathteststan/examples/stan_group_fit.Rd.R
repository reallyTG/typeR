library(breathteststan)


### Name: stan_group_fit
### Title: Bayesian Stan fit to 13C Breath Data in Multiple Groups
### Aliases: stan_group_fit

### ** Examples

## No test: 
library(breathtestcore)
library(dplyr)
data("usz_13c", package = "breathtestcore")
data = usz_13c %>%
  dplyr::filter( patient_id %in%
       c("norm_001", "norm_002", "norm_003", "norm_004",
         "pat_001", "pat_002","pat_003")) %>%
  breathtestcore::cleanup_data()
fit = stan_group_fit(data, chains = 1, iter = 100)
plot(fit) # calls plot.breathtestfit
coef(fit)
## End(No test)




