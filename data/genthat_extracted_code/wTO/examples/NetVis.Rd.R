library(wTO)


### Name: NetVis
### Title: NetVis
### Aliases: NetVis

### ** Examples


 X =  wTO.Complete( k =1, n = 5, Data = Microarray_Expression1,
 Overlap = ExampleGRF$x, method = "p",  plot = FALSE)
# Plot with the default aguments.
 NetVis(Node.1 = X$wTO$Node.1, Node.2 = X$wTO$Node.2,
 wTO = X$wTO$wTO_sign, cutoff = list(kind =
"Threshold", value = 0.50))

## Not run: 
##D # Plotting just the edges with p-value < 0.05, with straight edges, nodes clustered,
##D # no legend and mapipulation of the graph enabled.
##D   NetVis(Node.1 = X$wTO$Node.1, Node.2 = X$wTO$Node.2,
##D  wTO = X$wTO$wTO_sign, pval = X$wTO$pval_sign,
##D  padj = X$wTO$pval_sign,
##D   cutoff= list(kind = "pval", value = 0.05),
##D   smooth.edges = FALSE,
##D  Cluster = TRUE, legend = FALSE, manipulation = TRUE)
##D # Plotting just the edges with wTO > 0.50, no legend and the nodes:
##D # "ZNF738", "ZNF677" with triagle shape,
##D # no legend and mapipulation of the graph enabled.
##D  NetVis(Node.1 = X$wTO$Node.1, Node.2 = X$wTO$Node.2,
##D  wTO = X$wTO$wTO_sign, pval = X$wTO$pval_sign,
##D  padj = X$wTO$pval_sign, cutoff= list(kind = "Threshold", value = 0.5),legend = FALSE,
##D  shape = list(shape = "triangle", names = c("ZNF738", "ZNF677")))
##D 
##D  
## End(Not run)



