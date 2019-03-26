library(networktools)


### Name: plot.expectedInf
### Title: Plot "expectedInf" objects
### Aliases: plot.expectedInf

### ** Examples

## Don't show: 
myNetwork <- cor(depression[,1:5])
## End(Don't show)
out1 <- expectedInf(myNetwork)
plot(out1$step1)
## No test: 
plot(out1, order="value", zscore=TRUE)

igraph_obj <- igraph::graph_from_adjacency_matrix(cor(depression))
ei_igraph <- expectedInf(igraph_obj)

qgraph_obj <- qgraph::qgraph(cor(depression), plot=FALSE)
ei_qgraph <- expectedInf(qgraph_obj)

Ising_adj_mat <- IsingFit::IsingFit(social, plot=FALSE)$weiadj
ei_Ising <- expectedInf(Ising_adj_mat)
plot(ei_Ising)
## End(No test)



