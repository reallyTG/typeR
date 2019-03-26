library(batchtools)


### Name: addProblem
### Title: Define Problems for Experiments
### Aliases: addProblem Problem removeProblems

### ** Examples

## Don't show: 
 batchtools:::example_push_temp(1) 
## End(Don't show)
tmp = makeExperimentRegistry(file.dir = NA, make.default = FALSE)
addProblem("p1", fun = function(job, data) data, reg = tmp)
addProblem("p2", fun = function(job, data) job, reg = tmp)
addAlgorithm("a1", fun = function(job, data, instance) instance, reg = tmp)
addExperiments(repls = 2, reg = tmp)

# List problems, algorithms and job parameters:
tmp$problems
tmp$algorithms
getJobPars(reg = tmp)

# Remove one problem
removeProblems("p1", reg = tmp)

# List problems and algorithms:
tmp$problems
tmp$algorithms
getJobPars(reg = tmp)



