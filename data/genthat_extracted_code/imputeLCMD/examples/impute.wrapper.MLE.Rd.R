library(imputeLCMD)


### Name: impute.wrapper.MLE
### Title: MLE-based imputation of missing data.
### Aliases: impute.wrapper.MLE
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
  
exprsData.imputed = impute.wrapper.MLE(exprsData.MD)

## Not run: 
##D hist(exprsData[,1])
##D hist(exprsData.MD[,1])
##D hist(exprsData.imputed[,1])
## End(Not run)

## The function is currently defined as
function (dataSet.mvs) 
{
    s <- prelim.norm(dataSet.mvs)
    thetahat <- em.norm(s, showits = FALSE)
    rngseed(1234567)
    dataSet.imputed <- imp.norm(s, thetahat, dataSet.mvs)
    return(dataSet.imputed)
  }



