library(imputeLCMD)


### Name: impute.wrapper.KNN
### Title: Wrapper function for KNN imputation.
### Aliases: impute.wrapper.KNN
### Keywords: ~kwd1 ~kwd2

### ** Examples

# generate expression data matrix

exprsDataObj = generate.ExpressionData(nSamples1 = 6, nSamples2 = 6,
                          meanSamples = 0, sdSamples = 0.2,
                          nFeatures = 1000, nFeaturesUp = 50, nFeaturesDown = 50,
                          meanDynRange = 20, sdDynRange = 1,
                          meanDiffAbund = 1, sdDiffAbund = 0.2)
exprsData = exprsDataObj[[1]]
  
# insert 15% missing data with 100% missing not at random

m.THR = quantile(exprsData, probs = 0.15)
sd.THR = 0.1
MNAR.rate = 100
exprsData.MD.obj = insertMVs(exprsData,m.THR,sd.THR,MNAR.rate)
exprsData.MD = exprsData.MD.obj[[2]]

# perform missing data imputation
  
exprsData.imputed = impute.wrapper.KNN(exprsData.MD,15)

## The function is currently defined as
function (dataSet.mvs, K) 
{
    resultKNN = impute.knn(dataSet.mvs, k = K, rowmax = 0.99, 
        colmax = 0.99, maxp = 1500, rng.seed = sample(1:1000, 
            1))
    dataSet.imputed = resultKNN[[1]]
    return(dataSet.imputed)
  }



