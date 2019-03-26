library(rbi.helpers)


### Name: acceptance_rate
### Title: Compute acceptance rate
### Aliases: acceptance_rate

### ** Examples

example_run <- bi_read(system.file(package="rbi.helpers", "example_run.nc"))
example_model_file <- system.file(package="rbi", "PZ.bi")
example_bi <- attach_data(libbi(example_model_file), "output", example_run)
acceptance_rate(example_bi)



