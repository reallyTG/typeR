library(PCIT)


### Name: localClusteringCoefficient
### Title: Calculate the local clustering coefficient
### Aliases: localClusteringCoefficient

### ** Examples

	data(PCIT)
	m <- m[1:200,1:200]        # just use a small subset of the data
	result <- pcit(m)
	m[idx(result)] <- 0
	
	localClusteringCoefficient(m)



