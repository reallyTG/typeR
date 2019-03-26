library(nimble)


### Name: modelValuesBaseClass-class
### Title: Class 'modelValuesBaseClass'
### Aliases: [,CmodelValues-method [,CmodelValues-method,ANY,ANY
###   [,CmodelValues-method,character,missing
###   [,CmodelValues-method,character,missing,ANY-method
###   [,modelValuesBaseClass-method [<-,CmodelValues-method
###   [<-,modelValuesBaseClass-method [[,CmodelValues-method
###   [[<-,CmodelValues-method modelValuesBaseClass
###   modelValuesBaseClass-class

### ** Examples

mvConf <- modelValuesConf(vars = c('a', 'b'), 
	types = c('double', 'double'), 
	sizes = list(a = 1, b = c(2,2) ) )
mv <- modelValues(mvConf)
as.matrix(mv)
resize(mv, 2)
as.matrix(mv)
mv['a',1] <- 1
mv['a',2] <- 2
mv['b',1] <- matrix(0, nrow = 2, ncol = 2)
mv['b',2] <- matrix(1, nrow = 2, ncol = 2)
mv['a',]
as.matrix(mv)
basicModelCode <- nimbleCode({
a ~ dnorm(0,1)
for(i in 1:4)
	b[i] ~ dnorm(0,1)
})
basicModel <- nimbleModel(basicModelCode)
basicMV <- modelValues(basicModel, m = 2)	# m sets the number of rows
basicMV['b',]



