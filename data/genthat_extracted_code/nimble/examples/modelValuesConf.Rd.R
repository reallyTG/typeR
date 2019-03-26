library(nimble)


### Name: modelValuesConf
### Title: Create the confs for a custom NIMBLE modelValues object
### Aliases: modelValuesConf

### ** Examples

#Custom modelValues object:
mvConf <- modelValuesConf(vars = c('x', 'y'), 
				types = c('double', 'int'), 
			sizes = list(x = 3, y = c(2,2)))
custom_mv <- modelValues(mvConf, m = 2)
custom_mv['y',]



