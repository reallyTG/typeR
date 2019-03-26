library(imputeLCMD)


### Name: generate.RollUpMap
### Title: Generates peptide to protein map.
### Aliases: generate.RollUpMap
### Keywords: ~kwd1 ~kwd2

### ** Examples

  
exprsDataObj = generate.ExpressionData(nSamples1 = 6, nSamples2 = 6,
                          meanSamples = 0, sdSamples = 0.2,
                          nFeatures = 1000, nFeaturesUp = 50, nFeaturesDown = 50,
                          meanDynRange = 20, sdDynRange = 1,
                          meanDiffAbund = 1, sdDiffAbund = 0.2)
exprsData = exprsDataObj[[1]]
rollUpMap = generate.RollUpMap(round(dim(exprsData)[1]/2),exprsData)

## The function is currently defined as
function (nProt, pep.Expr.Data) 
{
    n = dim(pep.Expr.Data)[1]
    temp = 1:nProt
    pep.prot.Map = rep(0, n)
    pep.prot.Map[sample(temp)] = sample(temp)
    pep.prot.Map[which(pep.prot.Map == 0)] = sample.int(nProt, 
        size = (n - nProt), replace = T)
    return(pep.prot.Map)
  }



