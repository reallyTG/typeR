library(COSINE)


### Name: GA_search_PPI
### Title: Run genetic algorithm to search for the PPI sub-network
### Aliases: GA_search_PPI

### ** Examples


data(scaled_node_score)
data(scaled_edge_score)
data(PPI)

GA_result<-GA_search_PPI(lambda=0.5,scaled_node_score,scaled_edge_score,PPI,
num_iter=1, muCh=0.05, zToR=10, minsize=50)




