library(adnuts)


### Name: extract_samples
### Title: Extract posterior samples from a model fit.
### Aliases: extract_samples

### ** Examples

## A previously run fitted TMB model
fit <- readRDS(system.file('examples', 'fit_tmb.RDS', package='adnuts'))
post <- extract_samples(fit)
tail(apply(post, 2, median))



