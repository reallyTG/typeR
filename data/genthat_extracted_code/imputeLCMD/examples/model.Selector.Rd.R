library(imputeLCMD)


### Name: model.Selector
### Title: Model selector for hybrid missing data imputation
### Aliases: model.Selector
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

## The function is currently defined as
function (dataSet.mvs) 
{
    nFeatures = dim(dataSet.mvs)[1]
    nSamples = dim(dataSet.mvs)[2]
    model.selector = rep(0, nFeatures)
    mean.vect = rowMeans(dataSet.mvs, na.rm = T)
    pNAs = length(which(is.na(mean.vect)))/length(mean.vect)
    upper.q = 0.99
    q.normal = qnorm(seq((pNAs + 0.001), (upper.q + 0.001), (upper.q - 
        pNAs)/(upper.q * 100)), mean = 0, sd = 1)
    q.mean.vect = quantile(mean.vect, probs = seq(0.001, (upper.q + 
        0.001), 0.01), na.rm = T)
    temp.QR = lm(q.mean.vect ~ q.normal)
    QR.obj = temp.QR
    mean.CDD = temp.QR$coefficients[1]
    sd.CDD = as.numeric(temp.QR$coefficients[2])
    nPoints = 512
    min.support = mean.CDD - 4 * sd.CDD
    max.support = mean.CDD + 4 * sd.CDD
    mean.vect.sorted = sort(mean.vect)
    Fn <- ecdf(mean.vect.sorted)
    support = c(seq(min.support, min(mean.vect, na.rm = T), length = nPoints), 
        mean.vect.sorted, seq(max(mean.vect, na.rm = T), max.support, 
            length = nPoints))
    cdf.OD = Fn(support)
    cdf.CD = pnorm(support, mean = mean.CDD, sd = sd.CDD)
    diff.cdf = (cdf.CD - cdf.OD)
    obj.fnc = (diff.cdf + 1)/(cdf.OD + 1) - 1
    obj.fnc = obj.fnc * 10
    if (max(obj.fnc) > 0) {
        censoring.thr = support[which(obj.fnc == max(obj.fnc))]
    }
    else {
        censoring.thr = min.support - 1
    }
    model.selector[which(mean.vect > censoring.thr)] = 1
    result = list(model.selector, censoring.thr)
    return(result)
  }



