library(networktools)


### Name: expectedInf
### Title: Expected Influence
### Aliases: expectedInf

### ** Examples

out1 <- expectedInf(cor(depression[,1:5]))
## No test: 
out1$step1
out1$step2
plot(out1)
plot(out1, order="value", zscore=TRUE)

igraph_obj <- igraph::graph_from_adjacency_matrix(cor(depression))
out_igraph <- expectedInf(igraph_obj)

qgraph_obj <- qgraph::qgraph(cor(depression), DoNotPlot=TRUE)
out_qgraph <- expectedInf(qgraph_obj)

Ising_adj_mat <- IsingFit::IsingFit(social, plot=FALSE)$weiadj
out_Ising <- expectedInf(Ising_adj_mat)
plot(out_Ising)
## End(No test)



