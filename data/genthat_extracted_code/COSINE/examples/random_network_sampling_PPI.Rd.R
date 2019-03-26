library(COSINE)


### Name: random_network_sampling_PPI
### Title: To sample random sub-network from the PPI data
### Aliases: random_network_sampling_PPI

### ** Examples

data(PPI)
all_genes<-union(PPI[,1],PPI[,2])
ran_net<-random_network_sampling_PPI(size=30,PPI,all_genes)



