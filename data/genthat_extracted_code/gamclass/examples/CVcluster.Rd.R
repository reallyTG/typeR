library(gamclass)


### Name: CVcluster
### Title: Cross-validation estimate of predictive accuracy for clustered
###   data
### Aliases: CVcluster
### Keywords: models regression

### ** Examples

if(require(mlbench)&require(MASS)){
data(Vowel)
acc <- CVcluster(formula=Class ~., id = V1, data = Vowel, nfold = 15, FUN = lda,
              predictFUN=function(x, newdata, ...)predict(x, newdata, ...)$class,
                     printit = TRUE, cvparts = NULL, seed = 29)
}



