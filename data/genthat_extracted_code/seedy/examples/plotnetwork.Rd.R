library(seedy)


### Name: plotnetwork
### Title: Plot weighted transmission network
### Aliases: plotnetwork

### ** Examples

data(outbreak)
K <- networkmat(outbreak$epidata[,1], outbreak$epidata[,4])
plotnetwork(K, labels=outbreak$epidata[,1])
		



