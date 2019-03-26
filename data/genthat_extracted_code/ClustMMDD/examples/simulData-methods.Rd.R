library(ClustMMDD)


### Name: simulData-methods
### Title: Simulate a dataset from a given set of parameters in an instance
###   of 'modelKS'.
### Aliases: simulData-methods simulData

### ** Examples

data(exModelKS)
exModelKS
exData = simulData(exModelKS, 1000, 2)
str(exData)
head(exData$data)
head(exData$class)



