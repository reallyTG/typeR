library(imputeLCMD)


### Name: impute.MAR
### Title: Generic function for the imputation of MAR/MCAR missing data
### Aliases: impute.MAR
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

# run model.Selector
m.s = model.Selector(exprsData.MD)

# perform MAR/MCAR imputation
exprsData.MAR.imputed = impute.MAR (exprsData.MD, m.s, method = "MLE")

## The function is currently defined as
function (dataSet.mvs, model.selector, method = "MLE") 
{
    if (length(which(model.selector[[1]] == 1)) == 0) {
        dataSet.imputed = dataSet.mvs
    }
    else {
        dataSet.MCAR = dataSet.mvs[which(model.selector[[1]] == 
            1), ]
        switch(method, MLE = {
            dataSet.MCAR.imputed = impute.wrapper.MLE(dataSet.MCAR)
        }, SVD = {
            dataSet.MCAR.imputed = impute.wrapper.SVD(dataSet.MCAR, 
                K = 2)
        }, KNN = {
            dataSet.MCAR.imputed = impute.wrapper.KNN(dataSet.MCAR, 
                K = 15)
        })
        dataSet.imputed = dataSet.mvs
        dataSet.imputed[which(model.selector[[1]] == 1), ] = dataSet.MCAR.imputed
    }
    return(dataSet.imputed)
  }



