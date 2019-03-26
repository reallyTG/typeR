library(SigOptR)


### Name: create_suggestion
### Title: Create a suggestion for an experiment
### Aliases: create_suggestion

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
create_suggestion(experiment$id)}



