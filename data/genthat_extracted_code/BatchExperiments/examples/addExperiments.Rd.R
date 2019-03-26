library(BatchExperiments)


### Name: addExperiments
### Title: Add experiemts to the registry.
### Aliases: addExperiments Experiment

### ** Examples

### EXAMPLE 1 ###
reg = makeExperimentRegistry(id = "example1", file.dir = tempfile())

# Define a problem:
# Subsampling from the iris dataset.
data(iris)
subsample = function(static, ratio) {
  n = nrow(static)
  train = sample(n, floor(n * ratio))
  test = setdiff(seq(n), train)
  list(test = test, train = train)
}
addProblem(reg, id = "iris", static = iris,
           dynamic = subsample, seed = 123)

# Define algorithm "tree":
# Decision tree on the iris dataset, modeling Species.
tree.wrapper = function(static, dynamic, ...) {
  library(rpart)
  mod = rpart(Species ~ ., data = static[dynamic$train, ], ...)
  pred = predict(mod, newdata = static[dynamic$test, ], type = "class")
  table(static$Species[dynamic$test], pred)
}
addAlgorithm(reg, id = "tree", fun = tree.wrapper)

# Define algorithm "forest":
# Random forest on the iris dataset, modeling Species.
forest.wrapper = function(static, dynamic, ...) {
  library(randomForest)
  mod = randomForest(Species ~ ., data = static, subset = dynamic$train, ...)
  pred = predict(mod, newdata = static[dynamic$test, ])
  table(static$Species[dynamic$test], pred)
}
addAlgorithm(reg, id = "forest", fun = forest.wrapper)

# Define problem parameters:
pars = list(ratio = c(0.67, 0.9))
iris.design = makeDesign("iris", exhaustive = pars)

# Define decision tree parameters:
pars = list(minsplit = c(10, 20), cp = c(0.01, 0.1))
tree.design = makeDesign("tree", exhaustive = pars)

# Define random forest parameters:
pars = list(ntree = c(100, 500))
forest.design = makeDesign("forest", exhaustive = pars)

# Add experiments to the registry:
# Use  previously defined experimental designs.
addExperiments(reg, prob.designs = iris.design,
               algo.designs = list(tree.design, forest.design),
               repls = 2) # usually you would set repls to 100 or more.

# Optional: Short summary over problems and algorithms.
summarizeExperiments(reg)

# Optional: Test one decision tree job and one expensive (ntree = 1000)
# random forest job. Use findExperiments to get the right job ids.
do.tests = FALSE
if (do.tests) {
  id1 = findExperiments(reg, algo.pattern = "tree")[1]
  id2 = findExperiments(reg, algo.pattern = "forest",
                         algo.pars = (ntree == 1000))[1]
  testJob(reg, id1)
  testJob(reg, id2)
}

# Submit the jobs to the batch system
submitJobs(reg)

# Calculate the misclassification rate for all (already done) jobs.
reduce = function(job, res) {
  n = sum(res)
  list(mcr = (n-sum(diag(res)))/n)
}
res = reduceResultsExperiments(reg, fun = reduce)
print(res)

# Aggregate results using 'ddply' from package 'plyr':
# Calculate the mean over all replications of identical experiments
# (same problem, same algorithm and same parameters)
library(plyr)
vars = setdiff(names(res), c("repl", "mcr"))
aggr = ddply(res, vars, summarise, mean.mcr = mean(mcr))
print(aggr)

## Not run: 
##D ### EXAMPLE 2 ###
##D # define two simple test functions
##D testfun1 = function(x) sum(x^2)
##D testfun2 = function(x) -exp(-sum(abs(x)))
##D 
##D # Define ExperimentRegistry:
##D reg = makeExperimentRegistry("example02", seed = 123, file.dir = tempfile())
##D 
##D # Add the testfunctions to the registry:
##D addProblem(reg, "testfun1", static = testfun1)
##D addProblem(reg, "testfun2", static = testfun2)
##D 
##D # Use SimulatedAnnealing on the test functions:
##D addAlgorithm(reg, "sann", fun = function(static, dynamic) {
##D   upp = rep(10, 2)
##D   low = -upp
##D   start = sample(c(-10, 10), 2)
##D   res = optim(start, fn = static, lower = low, upper = upp, method = "SANN")
##D   res = res[c("par", "value", "counts", "convergence")]
##D   res$start = start
##D   return(res)
##D })
##D 
##D # add experiments and submit
##D addExperiments(reg, repls = 10)
##D submitJobs(reg)
##D 
##D # Gather informations from the experiments, in this case function value
##D # and whether the algorithm convergenced:
##D reduceResultsExperiments(reg, fun = function(job, res) res[c("value", "convergence")])
## End(Not run)



