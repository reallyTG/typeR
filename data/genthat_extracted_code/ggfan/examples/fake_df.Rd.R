library(ggfan)


### Name: fake_df
### Title: Fake dataset intended to resemble a set of MCMC samples of a
###   variable over one covariate (perhaps time),
### Aliases: fake_df
### Keywords: datasets

### ** Examples

# generate mean and variance for sequence of samples over time
library(magrittr)
library(tidyr)
set.seed(234)
N_time <- 50
N_sims <- 1000
time <- 1:N_time
mu <- time**2 * 0.03 + time * 0.3
sds <- exp(time**2 * -0.001 + time * 0.1)

# simulate 1000 samples from each time point
fake_data <- sapply(time, function(i) rnorm(N_sims, mu[i], sds[i]))

# gather into a long-form, tidy dataset
fake_df <- data.frame(x=time, t(fake_data)) %>%
tidyr::gather(key=Sim, value=y, -x)
# devtools::use_data(fake_df)




