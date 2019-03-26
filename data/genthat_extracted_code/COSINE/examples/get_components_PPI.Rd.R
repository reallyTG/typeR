library(COSINE)


### Name: get_components_PPI
### Title: Get all the components (connected clusters) of the sub-network
### Aliases: get_components_PPI

### ** Examples


data(scaled_node_score)
data(scaled_edge_score)
data(PPI)
gene_names<-names(scaled_node_score)
vector<-rep(0,length(scaled_node_score))
vector[sample(1:length(scaled_node_score),length(scaled_node_score)/3)]<-1
components<-get_components_PPI(gene_names,vector,PPI,minsize=3)




