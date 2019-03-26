library(flowr)


### Name: run
### Title: Run automated Pipelines
### Aliases: run run_flow run_pipe

### ** Examples

## Not run: 
##D 
##D ## Run a short pipeline (dry run)
##D run("sleep_pipe")
##D 
##D ## Run a short pipeline on the local machine
##D run("sleep_pipe", platform = "local", execute = TRUE)
##D 
##D ## Run a short pipeline on the a torque cluster (qsub)
##D run("sleep_pipe", platform = "torque", execute = TRUE)
##D 
##D ## Run a short pipeline on the a MOAB cluster (msub)
##D run("sleep_pipe", platform = "moab", execute = TRUE)
##D 
##D ## Run a short pipeline on the a IBM (LSF) cluster (bsub)
##D run("sleep_pipe", platform = "lsf", execute = TRUE)
##D 
##D ## Run a short pipeline on the a MOAB cluster (msub)
##D run("sleep_pipe", platform = "moab", execute = TRUE)
##D 
##D ## change parameters of the pipeline
##D ## All extra parameters are passed on to the function function.
##D run("sleep_pipe", platform = "lsf", execute = TRUE, x = 5)
##D 
## End(Not run)



