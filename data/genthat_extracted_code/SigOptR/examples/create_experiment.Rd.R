library(SigOptR)


### Name: create_experiment
### Title: Create an experiment
### Aliases: create_experiment

### ** Examples

env <- Sys.getenv("NOT_CRAN")
if (!identical(env, "true")) {
0
} else {
create_experiment(list(
  name="R test experiment",
  parameters=list(
    list(name="x1", type="double", bounds=list(min=0, max=100)),
    list(name="x2", type="double", bounds=list(min=0, max=100))
  )
))}



