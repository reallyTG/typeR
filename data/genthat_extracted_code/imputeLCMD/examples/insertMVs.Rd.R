library(imputeLCMD)


### Name: insertMVs
### Title: Generates missing data in a complete data matrix.
### Aliases: insertMVs
### Keywords: ~kwd1 ~kwd2

### ** Examples


# generate expression data matrix
exprsDataObj = generate.ExpressionData(nSamples1 = 6, nSamples2 = 6,
                          meanSamples = 0, sdSamples = 0.2,
                          nFeatures = 1000, nFeaturesUp = 50, nFeaturesDown = 50,
                          meanDynRange = 20, sdDynRange = 1,
                          meanDiffAbund = 1, sdDiffAbund = 0.2)
exprsData = exprsDataObj[[1]]
  
# insert 15% missing data with 50% missing not at random

m.THR = quantile(exprsData, probs = 0.15)
sd.THR = 0.1
MNAR.rate = 50
exprsData.MD.obj = insertMVs(exprsData,m.THR,sd.THR,MNAR.rate)
exprsData.MD = exprsData.MD.obj[[2]]

## Not run: 
##D hist(exprsData[,1])
##D hist(exprsData.MD[,1])
##D hist(exprsData.imputed[,1])
## End(Not run)

## The function is currently defined as
function (original, mean.THR, sd.THR, MNAR.rate) 
{
    originalNaNs = original
    nProt = nrow(original)
    nSamples = ncol(original)
    thr = matrix(rnorm(nSamples * nProt, mean.THR, sd.THR), nProt, 
        nSamples)
    indices.MNAR = which(original < thr)
    no.MNAR = round(MNAR.rate/100 * length(indices.MNAR))
    temp = matrix(original, 1, nSamples * nProt)
    temp[sample(indices.MNAR, no.MNAR)] = NaN
    indices.MCAR = which(!is.na(temp))
    no.MCAR = floor((100 - MNAR.rate)/100 * length(indices.MNAR))
    print(no.MCAR + no.MNAR)
    temp[sample(indices.MCAR, no.MCAR)] = NaN
    originalNaNs = matrix(temp, nProt, nSamples)
    originalNaNs_adjusted = originalNaNs
    noNaNs_Var = rowSums(is.na(originalNaNs))
    allNaNs_Vars = which(noNaNs_Var == nSamples)
    sampleIndexToReplace = sample(1:nSamples, length(allNaNs_Vars), 
        replace = T)
    for (i in 0:length(sampleIndexToReplace)) {
        originalNaNs_adjusted[allNaNs_Vars[i], sampleIndexToReplace[i]] = original[allNaNs_Vars[i], 
            sampleIndexToReplace[i]]
    }
    pNaNs = length(which(is.na(originalNaNs_adjusted)))/(nSamples * 
        nProt)
    print(pNaNs)
    return(list(original, originalNaNs_adjusted, pNaNs))
  }



