library(bgmm)


### Name: predict.mModel
### Title: Predictions for fitted Gaussian component model
### Aliases: predict.mModel

### ** Examples

 data(genotypes)

 modelSoft = soft(X=genotypes$X, knowns=genotypes$knowns, P=genotypes$B)

 preds = predict(modelSoft, X = genotypes$X)
 str(preds)



