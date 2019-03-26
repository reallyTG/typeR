library(imputeLCMD)


### Name: impute.MinProb
### Title: Imputation of left-censored missing data using stochastic
###   minimal value approach.
### Aliases: impute.MinProb
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
MNAR.rate = 50
exprsData.MD.obj = insertMVs(exprsData,m.THR,sd.THR,MNAR.rate)
exprsData.MD = exprsData.MD.obj[[2]]

# perform missing data imputation
exprsData.imputed = impute.MinProb(exprsData.MD,0.01,1)

## Not run: 
##D hist(exprsData[,1])
##D hist(exprsData.MD[,1])
##D hist(exprsData.imputed[,1])
## End(Not run)

## The function is currently defined as
function (dataSet.mvs, q = 0.01, tune.sigma = 1) 
{
    nSamples = dim(dataSet.mvs)[2]
    nFeatures = dim(dataSet.mvs)[1]
    dataSet.imputed = dataSet.mvs
    min.samples = apply(dataSet.imputed, 2, quantile, prob = q, 
        na.rm = T)
    count.NAs = apply(!is.na(dataSet.mvs), 1, sum)
    count.NAs = count.NAs/nSamples
    dataSet.filtered = dataSet.mvs[which(count.NAs > 0.5), ]
    protSD = apply(dataSet.filtered, 1, sd)
    sd.temp = median(protSD, na.rm = T) * tune.sigma
    print(sd.temp)
    for (i in 1:(nSamples)) {
        dataSet.to.impute.temp = rnorm(nFeatures, 
                                        mean = min.samples[i], 
                                        sd = sd.temp)
        dataSet.imputed[which(is.na(dataSet.mvs[, i])), i] = 
        dataSet.to.impute.temp[which(is.na(dataSet.mvs[,i]))]
    }
    return(dataSet.imputed)
  }



