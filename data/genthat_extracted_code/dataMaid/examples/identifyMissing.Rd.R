library(dataMaid)


### Name: identifyMissing
### Title: A checkFunction for identifying miscoded missing values.
### Aliases: identifyMissing

### ** Examples

##data(testData)
##testData$miscodedMissingVar
##identifyMissing(testData$miscodedMissingVar)

#Identify miscoded numeric missing values
v1 <- c(1:15, 99)
v2 <- c(v1, 98)
v3 <- c(-999, v2, 9999)
identifyMissing(v1)
identifyMissing(v2)
identifyMissing(v3)
identifyMissing(factor(v3))




