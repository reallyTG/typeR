library(PCIT)


### Name: clusteringCoefficientPercent
### Title: Calculate the clustering coefficient as a percentage
### Aliases: clusteringCoefficientPercent

### ** Examples

	data(PCIT)
	m <- m[1:200,1:200]        # just use a small subset of the data
	result <- pcit(m)
	m[idx(result)] <- 0
	
	clusteringCoefficientPercent(m)



