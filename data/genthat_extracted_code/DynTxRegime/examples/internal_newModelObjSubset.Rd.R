library(DynTxRegime)


### Name: .newModelObjSubset
### Title: Create an object of class '"ModelObj_SubsetList"' or
###   '"ModelObj_SubsetList_DecisionPointList"'
### Aliases: .newModelObjSubset .newModelObjSubset,list-method
### Keywords: internal

### ** Examples


  models <- list()

  models[[1L]] <- buildModelObjSubset(model = ~x1, 
                                      solver.method = 'lm', 
                                      subset = "subset1", 
                                      dp = 1L)

  models[[2L]] <- buildModelObjSubset(model = ~x2, 
                                      solver.method = 'lm', 
                                      subset = "subset2", 
                                      dp = 1L)

  result <- DynTxRegime:::.newModelObjSubset(models)

  is(result)

  models[[3L]] <- buildModelObjSubset(model = ~x3,
                                      solver.method = 'lm', 
                                      subset = "subset1", 
                                      dp = 2L)

  result <- DynTxRegime:::.newModelObjSubset(models)

  is(result)




