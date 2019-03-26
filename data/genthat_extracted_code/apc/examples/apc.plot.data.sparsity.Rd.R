library(apc)


### Name: apc.plot.data.sparsity
### Title: This plot shows heat map of the sparsity of a data matrix.
### Aliases: apc.plot.data.sparsity

### ** Examples

#####################
#  EXAMPLE with artificial data
#  generate a 3x4 matrix in "AP" data.format with the numbers 1..12

m.data  	<- matrix(data=seq(length.out=12),nrow=3,ncol=4)
m.data
data.list	<- apc.data.list(m.data,"AP")
apc.plot.data.sparsity(data.list)

#####################
#	EXAMPLE with Japanese breast cancer data
#	get data list, then make sparsity plots.

data.list	<- data.asbestos()					
apc.plot.data.sparsity(data.list)




