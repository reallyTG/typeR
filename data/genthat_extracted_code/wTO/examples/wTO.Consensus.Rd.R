library(wTO)


### Name: wTO.Consensus
### Title: wTO.Consensus
### Aliases: wTO.Consensus

### ** Examples

## Not run: 
##D EXAMPLE =  wTO.Complete( k =1, n = 200, Data = Microarray_Expression1,
##D                                       Overlap = ExampleGRF$x, method = "p")
##D 
##D # Constructing the consensus network
##D data = list(data.frame(Node.1 = EXAMPLE$wTO$Node.1,
##D Node.2 = EXAMPLE$wTO$Node.2,
##D wto_sig = EXAMPLE$wTO$wTO_sign,
##D pvalsig = EXAMPLE$wTO$pval_sig),
##D data.frame(Node.1 = EXAMPLE$wTO$Node.1,
##D Node.2 = EXAMPLE$wTO$Node.2,
##D wtoabs = EXAMPLE$wTO$wTO_abs,
##D pvalabs = EXAMPLE$wTO$pval_abs) )
##D CONS = wTO.Consensus(data)
##D 
## End(Not run)



