library(nimble)


### Name: modelValues
### Title: Create a NIMBLE modelValues Object
### Aliases: modelValues

### ** Examples

#From model object:
code <- nimbleCode({
 a ~ dnorm(0,1)
 for(i in 1:3){
	for(j in 1:3)
		b[i,j] ~ dnorm(0,1)
	}
})
Rmodel <- nimbleModel(code)
Rmodel_mv <- modelValues(Rmodel, m = 2)
#Custom modelValues object:
mvConf <- modelValuesConf(vars = c('x', 'y'),
             types = c('double', 'int'),
             sizes = list(x = 3, y = c(2,2)))
custom_mv <- modelValues(mvConf, m = 2)
custom_mv['y',]



