library(ShortForm)


### Name: simulatedAnnealing
### Title: An adaptation of the simulated annealing algorithm for
###   psychometric models.
### Aliases: simulatedAnnealing

### ** Examples

## Not run: 
##D data(exampleAntModel)
##D data(simulated_test_data)
##D trial1 <- simulatedAnnealing(initialModel = lavaan::cfa(model = exampleAntModel,
##D                                                         data = simulated_test_data),
##D                              originalData = simulated_test_data, maxSteps = 3,
##D                              fitStatistic = 'rmsea', maximize = FALSE)
##D # lavaan::summary(trial1[[1]]) # shows the resulting model
##D 
##D trial2 <- simulatedAnnealing(initialModel = exampleAntModel,
##D originalData = simulated_test_data,
##D maxSteps = 2, maxItems = 30, items = paste0("Item", 1:56))
##D # lavaan::summary(trial2[[1]]) # shows the resulting model
## End(Not run)



