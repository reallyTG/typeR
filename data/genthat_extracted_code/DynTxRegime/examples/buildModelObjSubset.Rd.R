library(DynTxRegime)


### Name: buildModelObjSubset
### Title: Create Model Objects for Subsets of Data.
### Aliases: buildModelObjSubset

### ** Examples


# Consider a 2 decision point trial. At the 1st decision point, the subset of 
# treatment options available to each patient is always set "set1."
# At the 2nd decision point, some patients are eligible to receive
# treatment from set "set2a" and others from set "set2b." The outcome
# for these subsets will be modeled as ~ x1 + x2 and ~ x2 + x3, respectively.
#
# All parameter estimates are to be obtained used lm and predictions obtained using predict.
#
# The following illustrates how to build these model objects.

  model <- list()

  model[[1]] <- buildModelObjSubset(dp = 1, subset = "set1",
                                    model = ~ x1 + x2 + x3, solver.method = 'lm')

  model[[2]] <- buildModelObjSubset(dp = 2, subset = "set2a",
                                    model = ~ ~ x1 + x2, solver.method = 'lm')

  model[[3]] <- buildModelObjSubset(dp = 2, subset = "set2b",
                                    model = ~ x2 + x3, solver.method = 'lm')





