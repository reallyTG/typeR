library(CVST)


### Name: constructData
### Title: Construction and Handling of 'CVST.data' Objects
### Aliases: constructData getN getSubset getX shuffleData isClassification
###   isRegression

### ** Examples

nsine = noisySine(10)
isClassification(nsine)
isRegression(nsine)
getN(nsine)
getX(nsine)
nsineShuffeled = shuffleData(nsine)
getX(nsineShuffeled)
getSubset(nsineShuffeled, 1:3)



