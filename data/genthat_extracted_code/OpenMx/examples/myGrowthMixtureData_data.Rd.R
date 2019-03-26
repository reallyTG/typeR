library(OpenMx)


### Name: myGrowthMixtureData
### Title: Data for a growth mixture model
### Aliases: myGrowthMixtureData
### Keywords: datasets

### ** Examples

data(myGrowthMixtureData)

matplot(t(myGrowthMixtureData), type='l', lty=1)

data(myGrowthKnownClassData)
all(myGrowthKnownClassData[,-6]==myGrowthMixtureData)



