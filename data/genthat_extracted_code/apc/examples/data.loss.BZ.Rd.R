library(apc)


### Name: data.loss.BZ
### Title: Motor data
### Aliases: data.loss.BZ

### ** Examples

#########################
##	It is convient to construct a data variable

data	<- data.loss.BZ()

##	To see the content of the data

data

#########################
#	Fit geometric chain-ladder model

apc.fit.table(data,"log.normal.response")




