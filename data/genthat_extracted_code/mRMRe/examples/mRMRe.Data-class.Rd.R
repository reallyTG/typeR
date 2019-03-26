library(mRMRe)


### Name: mRMRe.Data-class
### Title: Class '"mRMRe.Data"'
### Aliases: mRMRe.Data-class mRMR.data
### Keywords: classes

### ** Examples

showClass("mRMRe.Data")

set.thread.count(2)

## load data
data(cgps)

## equivalent ways of building an mRMRe.Data object
ge <- mRMR.data(data = data.frame(cgps.ge[ , 1:10, drop=FALSE]))
ge <- new("mRMRe.Data", data = data.frame(cgps.ge[ , 1:10, drop=FALSE]))

## print data
print(featureData(ge)[1:3, 1:3])

## print feature names
print(featureNames(ge))

## print the first sample names
print(head(sampleNames(ge)))

## print the first sample weights
print(head(sampleWeights(ge)))



