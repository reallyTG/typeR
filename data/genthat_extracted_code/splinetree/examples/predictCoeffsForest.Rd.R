library(splinetree)


### Name: predictCoeffsForest
### Title: Predict spline coefficients for a testset using a splineforest.
### Aliases: predictCoeffsForest

### ** Examples

trainingSetPreds <- predictCoeffsForest(forest)
newData <- data.frame("WHITE" = 0, "BLACK"=1, "HISP"=0, "Num_sibs"=3,
   "HGC_MOTHER"=12, "HGC_FATHER"=12, "SEX"=1)
predictCoeffsForest(forest, testdata = newData)



