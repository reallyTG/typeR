library(SigOptR)


### Name: fetch_experiment
### Title: Fetch an experiment
### Aliases: fetch_experiment

### ** Examples

env <- Sys.getenv("NOT_CRAN")
if (!identical(env, "true")) {
0
} else {
experiment <- create_experiment(list(
  name="R test experiment",
  parameters=list(
    list(name="x1", type="double", bounds=list(min=0, max=100)),
    list(name="x2", type="double", bounds=list(min=0, max=100))
  )
))
fetch_experiment(experiment$id)}



