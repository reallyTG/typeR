library(rbi.helpers)


### Name: adapt_particles
### Title: Adapt the number of particles
### Aliases: adapt_particles

### ** Examples

example_obs <- bi_read(system.file(package="rbi", "example_dataset.nc"))
example_model <- bi_model(system.file(package="rbi", "PZ.bi"))
example_bi <- libbi(model = example_model, obs = example_obs)
obs_states <- var_names(example_model, "obs")
max_time <- max(vapply(example_obs[obs_states], function(x) { max(x[["time"]])}, 0))
## No test: 
adapted <- adapt_particles(example_bi, nsamples = 128, end_time = max_time)
## End(No test)



