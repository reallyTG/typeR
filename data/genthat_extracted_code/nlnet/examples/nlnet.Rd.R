library(nlnet)


### Name: nlnet
### Title: Non-Linear Network reconstruction from expression matrix
### Aliases: nlnet

### ** Examples

 
 ## generating the data matrix & hiden clusters as a sample
  input<-data.gen(n.genes=40, n.grps=4)
## now input includes data matrix and hiden clusters, so get the matrix as input.
input<-input$data 
##change the ploting method
 result<-nlnet(input,plot.method="graph")
  ## get the result and see it values
 graph<-result$graph ##a igraph object.
 comm<-result$community ##community of the graph
 
 ## use different community detection method
 #nlnet(input,gene.community.method="label.propagation")
 
 ## change the fdr pro to control connections of genes
 ## adjust the modularity size
 #nlnet(input,conn.proportion=0.005,min.module.size=10)
 



