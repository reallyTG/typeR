library(assortnet)


### Name: assortment.discrete
### Title: Assortment on discrete vertex values
### Aliases: assortment.discrete

### ** Examples

	# DIRECTED NETWORK EXAMPLE
	# Create a random directed network
	N <- 20
	dyads <- expand.grid(ID1=1:20,ID2=1:20)
	dyads <- dyads[which(dyads$ID1 != dyads$ID2),]
	weights <- rbeta(nrow(dyads),1,15)
	network <- matrix(0, nrow=N, ncol=N)
	network[cbind(dyads$ID1,dyads$ID2)] <- weights

	# Create random discrete trait values
	traits <- rpois(N,2)
	
	# Test for assortment as binary network
	assortment.discrete(network,traits,weighted=FALSE)
	
	# Test for assortment as weighted network
	assortment.discrete(network,traits,weighted=TRUE)
	
	
	
	# UNDIRECTED NETWORK EXAMPLE
	# Create a random undirected network
	N <- 20
	dyads <- expand.grid(ID1=1:20,ID2=1:20)
	dyads <- dyads[which(dyads$ID1 < dyads$ID2),]
	weights <- rbeta(nrow(dyads),1,15)
	network <- matrix(0, nrow=N, ncol=N)
	network[cbind(dyads$ID1,dyads$ID2)] <- weights
	network[cbind(dyads$ID2,dyads$ID1)] <- weights
	
	# Create random discrete trait values
	traits <- rpois(N,2)
	
	# Test for assortment as binary network
	assortment.discrete(network,traits,weighted=FALSE)
	
	# Test for assortment as weighted network
	assortment.discrete(network,traits,weighted=TRUE)




