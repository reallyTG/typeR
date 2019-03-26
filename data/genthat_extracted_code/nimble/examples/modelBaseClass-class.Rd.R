library(nimble)


### Name: modelBaseClass-class
### Title: Class 'modelBaseClass'
### Aliases: [[,modelBaseClass-method [[<-,modelBaseClass-method
###   checkConjugacy expandNodeNames getCode getDependencies
###   getDependenciesList getDimension getDistribution getDownstream
###   getNodeNames getVarNames initializeInfo isBinary isData isDeterm
###   isDiscrete isEndNode isMultivariate isStoch isTruncated isUnivariate
###   modelBaseClass modelBaseClass-class newModel resetData setData
###   setInits topologicallySortNodes

### ** Examples

code <- nimbleCode({
    mu ~ dnorm(0, 1)
    x[1] ~ dnorm(mu, 1)
    x[2] ~ dnorm(mu, 1)
})
Rmodel <- nimbleModel(code)
modelVars <- Rmodel$getVarNames()   ## returns 'mu' and 'x'
modelNodes <- Rmodel$getNodeNames()   ## returns 'mu', 'x[1]' and 'x[2]'
Rmodel$resetData()
Rmodel$setData(list(x = c(1.2, NA)))   ## flags only 'x[1]' node as data
Rmodel$isData(c('mu', 'x[1]', 'x[2]'))   ## returns c(FALSE, TRUE, FALSE)



