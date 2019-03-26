library(apc)


### Name: apc.plot.fit.all
### Title: Make all fit plots.
### Aliases: apc.plot.fit.all

### ** Examples

#####################
#	EXAMPLE with Italian bladder cancer data

#	get data list, then make all descriptive plots.
# 	Note that warnings are given in relation to the data chosen thinning
#	This can be avoided by working with the individual plots, and in particular
#	with apc.plot.data.within where the thinning happens.

data.list	<- data.Italian.bladder.cancer()
fit			<- apc.fit.model(data.list,"poisson.dose.response","APC")
apc.plot.fit.all(fit)



