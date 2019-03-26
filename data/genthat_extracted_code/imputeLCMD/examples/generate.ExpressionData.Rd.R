library(imputeLCMD)


### Name: generate.ExpressionData
### Title: Generate Peptide/Protein Expression Data
### Aliases: generate.ExpressionData
### Keywords: ~kwd1 ~kwd2

### ** Examples


dataObj = generate.ExpressionData(nSamples1 = 6, nSamples2 = 6,
                          meanSamples = 0, sdSamples = 0.2,
                          nFeatures = 2000, nFeaturesUp = 100, nFeaturesDown = 100,
                          meanDynRange = 20, sdDynRange = 1,
                          meanDiffAbund = 1, sdDiffAbund = 0.2)
exprsData = dataObj[[1]]
  
## Not run: 
##D hist(exprsData[,1])
## End(Not run)

## The function is currently defined as
function (nSamples1, nSamples2, meanSamples, sdSamples, nFeatures, 
    nFeaturesUp, nFeaturesDown, meanDynRange, sdDynRange, meanDiffAbund, 
    sdDiffAbund) 
{
    nSamples = nSamples1 + nSamples2
    data = matrix(rnorm(nSamples * nFeatures, meanSamples, sdSamples), 
        nFeatures, nSamples)
    means = rnorm(nFeatures, meanDynRange, sdDynRange)
    data = data + means
    conditions = c(rep(1, nSamples1), rep(2, nSamples2))
    DE.coef.up = matrix(rnorm(nFeaturesUp * nSamples1, meanDiffAbund, 
        sdDiffAbund), nFeaturesUp, nSamples1)
    DE.coef.down = matrix(rnorm(nFeaturesDown * nSamples2, meanDiffAbund, 
        sdDiffAbund), nFeaturesDown, nSamples2)
    data[1:nFeaturesUp, conditions == 1] = DE.coef.up + data[1:nFeaturesUp, 
        conditions == 1]
    data[(nFeaturesUp + 1):(nFeaturesUp + nFeaturesDown), conditions == 
        2] = DE.coef.down + data[(nFeaturesUp + 1):(nFeaturesUp + 
        nFeaturesDown), conditions == 2]
    labelFeatures = c(rep(1, nFeaturesUp), rep(2, nFeaturesDown), 
        rep(3, nFeatures - (nFeaturesUp + nFeaturesDown)))
    row.names(data) = 1:nFeatures
    return(list(data, conditions, labelFeatures))
  }



