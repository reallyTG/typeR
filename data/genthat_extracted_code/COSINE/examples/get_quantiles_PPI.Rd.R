library(COSINE)


### Name: get_quantiles_PPI
### Title: Get the five quantile values of lambda for analysis of gene
###   expression and PPI network data
### Aliases: get_quantiles_PPI

### ** Examples

data(scaled_node_score)
data(scaled_edge_score)
data(PPI)
quantiles<-get_quantiles_PPI(scaled_node_score,scaled_edge_score,
PPI,klist=seq(50,60,by=5),pop_size=10)



