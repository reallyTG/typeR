library(rstan)


### Name: monitor
### Title: Compute summaries of MCMC draws and monitor convergence
### Aliases: monitor

### ** Examples

csvfiles <- dir(system.file('misc', package = 'rstan'),
                pattern = 'rstan_doc_ex_[0-9].csv', full.names = TRUE)
fit <- read_stan_csv(csvfiles)
# The following is just for the purpose of giving an example
# since print can be used for a stanfit object.
monitor(extract(fit, permuted = FALSE, inc_warmup = TRUE))



