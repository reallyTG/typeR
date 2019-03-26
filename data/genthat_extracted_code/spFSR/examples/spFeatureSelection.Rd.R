library(spFSR)


### Name: spFeatureSelection
### Title: Feature selection and ranking by SPSA-FSR
### Aliases: spFeatureSelection

### ** Examples

## No test: 
data(iris)         # load the data
library(mlr)       # load the mlr package

if( requireNamespace('class', quietly = TRUE) ){

  # Load class so that a knn classifier can be defined
  library('class')

  # define classification task on 20 random samples
  task    <- makeClassifTask(data = iris[sample(150, 20),],
                             target = 'Species')

  # define a wrapper (1-KNN classifier)
  wrapper <- makeLearner('classif.knn', k = 1)


  # run spsa with 2 iterations
  # to select 1 out of 4 features
  spsaMod <- spFeatureSelection( task = task,
                                 wrapper = wrapper,
                                 measure = mmce,
                                 num.features.selected = 1,
                                 num.cores = 1,
                                 iters.max = 2)

  # obtain summary
  summary(spsaMod)


  # plot with error bars
  plot(spsaMod, errorBar = TRUE)

  # obtain the wrapped model with the best performing features
  bestMod <- getBestModel(spsaMod)

  # predict using the best mod
  pred    <- predict(bestMod, task = spsaMod$task.spfs )

  # Obtain confusion matrix
  calculateConfusionMatrix( pred )

  # Get the importance ranks of best performing features
  getImportance(spsaMod)
  plotImportance(spsaMod)

  }

## End(No test)





