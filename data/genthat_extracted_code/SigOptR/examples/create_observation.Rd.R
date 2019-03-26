library(SigOptR)


### Name: create_observation
### Title: Create an observation for an experiment
### Aliases: create_observation

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
suggestion <- create_suggestion(experiment$id)
create_observation(experiment$id, list(suggestion=suggestion$id, value=99.08))
create_observation(experiment$id, list(suggestion=suggestion$id, value=99.58, value_stddev=0.1))}



