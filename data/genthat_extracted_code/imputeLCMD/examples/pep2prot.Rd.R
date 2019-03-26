library(imputeLCMD)


### Name: pep2prot
### Title: Peptide to protein mapping.
### Aliases: pep2prot
### Keywords: ~kwd1 ~kwd2

### ** Examples


# generate expression data matrix
dataObj = generate.ExpressionData(nSamples1 = 6, nSamples2 = 6,
                          meanSamples = 0, sdSamples = 0.2,
                          nFeatures = 2000, nFeaturesUp = 100, nFeaturesDown = 100,
                          meanDynRange = 20, sdDynRange = 1,
                          meanDiffAbund = 1, sdDiffAbund = 0.2)
exprsData = dataObj[[1]]

# insert 15% missing data with 100% missing not at random
m.THR = quantile(exprsData, probs = 0.15)
sd.THR = 0.1
MNAR.rate = 100
exprsData.MD.obj = insertMVs(exprsData,m.THR,sd.THR,MNAR.rate)
exprsData.MD = exprsData.MD.obj[[2]]

# generate rollup.map
rollUpMap = generate.RollUpMap(round(dim(exprsData.MD)[1]/2),exprsData.MD)

# peptide to protein mapping
protExprsData = pep2prot(exprsData.MD,rollUpMap)

## The function is currently defined as
function (pep.Expr.Data, rollup.map) 
{
    protIDs = unique(rollup.map)
    prot.Expr.Data = matrix(, nrow = length(protIDs), ncol = dim(pep.Expr.Data)[2])
    for (i in 1:length(protIDs)) {
        temp = protIDs[i]
        pepSet = pep.Expr.Data[which(rollup.map == temp), ]
        if (length(which(rollup.map == temp)) == 1) {
            prot.Expr.Data[i, ] = pepSet
        }
        else {
            prot.Expr.Data[i, ] = apply(pepSet, 2, median, na.rm = T)
        }
    }
    return(prot.Expr.Data)
  }



