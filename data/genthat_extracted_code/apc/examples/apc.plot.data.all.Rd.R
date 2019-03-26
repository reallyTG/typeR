library(apc)


### Name: apc.plot.data.all
### Title: Make all descriptive plots.
### Aliases: apc.plot.data.all

### ** Examples

#####################
#  EXAMPLE with artificial data
#  generate a 3x4 matrix in "AP" data.format with the numbers 1..12

m.data  	<- matrix(data=seq(length.out=12),nrow=3,ncol=4)
m.data
data.list	<- apc.data.list(m.data,"AP")
apc.plot.data.all(data.list,log="")				

#####################
#	EXAMPLE with Italian bladder cancer data

#	get data list, then make all descriptive plots.
# 	Note that warnings are given in relation to the data chosen thinning
#	This can be avoided by working with the individual plots, and in particular
#	with apc.plot.data.within where the thinning happens.

data.list	<- data.Italian.bladder.cancer()	
apc.plot.data.all(data.list)



