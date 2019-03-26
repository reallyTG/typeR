library(imputeLCMD)


### Name: impute.MAR.MNAR
### Title: Hybrid imputation method
### Aliases: impute.MAR.MNAR
### Keywords: ~kwd1 ~kwd2

### ** Examples

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

# perform MAR-MNAR imputation
exprsData.MAR.imputed = impute.MAR.MNAR(exprsData.MD, m.s, 
                           method.MAR = "KNN", method.MNAR = "QRILC")

## The function is currently defined as
function (dataSet.mvs, model.selector, method.MAR = "KNN", method.MNAR = "QRILC") 
{
    switch(method.MAR, MLE = {
        dataSet.MCAR.imputed = impute.MAR(dataSet.mvs, model.selector, 
            method = "MLE")
    }, SVD = {
        dataSet.MCAR.imputed = impute.MAR(dataSet.mvs, model.selector, 
            method = "SVD")
    }, KNN = {
        dataSet.MCAR.imputed = impute.MAR(dataSet.mvs, model.selector, 
            method = "KNN")
    })
    switch(method.MNAR, QRILC = {
        dataSet.complete.obj = impute.QRILC(dataSet.MCAR.imputed, 
            tune.sigma = 0.3)
        dataSet.complete = dataSet.complete.obj[[1]]
    }, MinDet = {
        dataSet.complete = impute.MinDet(dataSet.MCAR.imputed)
    }, MinProb = {
        dataSet.complete = impute.MinProb(dataSet.MCAR.imputed)
    })
    return(dataSet.complete)
  }



