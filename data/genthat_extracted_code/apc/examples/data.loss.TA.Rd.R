library(apc)


### Name: data.loss.TA
### Title: Motor data
### Aliases: data.loss.TA

### ** Examples

#########################
##	It is convient to construct a data variable

data	<- data.loss.TA()

##	To see the content of the data

data

#########################
#	Fit chain-ladder model

apc.fit.table(data,"poisson.response")

#	The overdispersed poisson model is experimental at the moment,
#	so not documented
apc.fit.table(data,"od.poisson.response")





