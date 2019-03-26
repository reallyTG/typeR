library(rbi.helpers)


### Name: DIC
### Title: Compute Deviance Information Criterion (DIC) for a libbi model
### Aliases: DIC DIC.libbi

### ** Examples

example_run <- bi_read(system.file(package="rbi", "example_output.nc"))
example_model_file <- system.file(package="rbi", "PZ.bi")
example_bi <- attach_data(libbi(example_model_file), "output", example_run)
DIC(example_bi)



