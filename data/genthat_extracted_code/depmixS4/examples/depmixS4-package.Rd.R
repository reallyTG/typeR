library(depmixS4)


### Name: depmixS4-package
### Title: depmixS4 provides classes for specifying and fitting hidden
###   Markov models
### Aliases: depmixS4 depmixS4-package
### Keywords: package

### ** Examples

	# create a 2 state model with one continuous and one binary response
	data(speed)
	mod <- depmix(list(rt~1,corr~1),data=speed,nstates=2,family=list(gaussian(),multinomial()))
	# print the model, formulae and parameter values (ie the starting values)
	mod



