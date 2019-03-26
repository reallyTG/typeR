library(caret)


### Name: gafs_initial
### Title: Ancillary genetic algorithm functions
### Aliases: gafs_initial gafs_lrSelection gafs_rwSelection
###   gafs_tourSelection gafs_uCrossover gafs_spCrossover gafs_raMutation
###   caretGA rfGA treebagGA gafs_nlrSelection

### ** Examples


pop <- gafs_initial(vars = 10, popSize = 10)
pop

gafs_lrSelection(population = pop, fitness = 1:10)

gafs_spCrossover(population = pop, fitness = 1:10, parents = 1:2)


## Not run: 
##D ## Hypothetical examples
##D lda_ga <- gafs(x = predictors,
##D                y = classes,
##D                gafsControl = gafsControl(functions = caretGA),
##D                ## now pass arguments to `train`
##D                method = "lda",
##D                metric = "Accuracy"
##D                trControl = trainControl(method = "cv", classProbs = TRUE))
##D 
##D rf_ga <- gafs(x = predictors,
##D               y = classes,
##D               gafsControl = gafsControl(functions = rfGA),
##D               ## these are arguments to `randomForest`
##D               ntree = 1000,
##D               importance = TRUE)
##D 	
## End(Not run)





