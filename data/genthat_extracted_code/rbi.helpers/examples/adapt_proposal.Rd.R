library(rbi.helpers)


### Name: adapt_proposal
### Title: Adapt the proposal distribution of MCMC using the covariance of
###   samples
### Aliases: adapt_proposal

### ** Examples

example_obs <- bi_read(system.file(package="rbi", "example_dataset.nc"))
example_model <- bi_model(system.file(package="rbi", "PZ.bi"))
example_bi <- libbi(model = example_model, obs = example_obs)
obs_states <- var_names(example_model, type="obs")
max_time <- max(vapply(example_obs[obs_states], function(x) { max(x[["time"]])}, 0))
# adapt to acceptance rate between 0.1 and 0.5
## No test: 
adapted <- adapt_proposal(example_bi, nsamples = 100, end_time = max_time,
                               min = 0.1, max = 0.5, nparticles = 256, correlations = TRUE)
## End(No test)



