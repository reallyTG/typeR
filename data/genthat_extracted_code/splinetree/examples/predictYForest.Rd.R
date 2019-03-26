library(splinetree)


### Name: predictYForest
### Title: Predict responses for a testset using a splineforest.
### Aliases: predictYForest

### ** Examples

trainingSetPreds <- predictYForest(forest)
newData <- data.frame("AGE"=21, "WHITE" = 0, "BLACK"=1, "HISP"=0,
   "Num_sibs"=3, "HGC_MOTHER"=12, "HGC_FATHER"=12, "SEX"=1)
predictYForest(forest, testdata = newData)



