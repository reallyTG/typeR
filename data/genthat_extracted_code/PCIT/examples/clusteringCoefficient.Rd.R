library(PCIT)


### Name: clusteringCoefficient
### Title: Calculate the clustering coefficient
### Aliases: clusteringCoefficient

### ** Examples

	data(PCIT)
	m <- m[1:200,1:200]        # just use a small subset of the data
	result <- pcit(m)
	m[idx(result)] <- 0
	
	clusteringCoefficient(m)



