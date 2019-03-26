library(imputeLCMD)


### Name: impute.MinDet
### Title: Imputation of left-censored missing data using a deterministic
###   minimal value approach.
### Aliases: impute.MinDet
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
  
exprsData.imputed = impute.MinDet(exprsData.MD)

## Not run: 
##D hist(exprsData[,1])
##D hist(exprsData.MD[,1])
##D hist(exprsData.imputed[,1])
## End(Not run)

## The function is currently defined as
function (dataSet.mvs, q = 0.01) 
{
    nSamples = dim(dataSet.mvs)[2]
    dataSet.imputed = dataSet.mvs
    lowQuantile.samples = apply(dataSet.imputed, 2, quantile, 
        prob = q, na.rm = T)
    for (i in 1:(nSamples)) {
        dataSet.imputed[which(is.na(dataSet.mvs[, i])), i] = lowQuantile.samples[i]
    }
    return(dataSet.imputed)
  }



