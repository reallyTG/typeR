library(wTO)


### Name: wTO.export
### Title: wTO.export
### Aliases: wTO.export

### ** Examples

## Not run: 
##D EXAMPLE =  wTO.Complete( k =1, n = 200, Data = ExampledfExpression,
##D                                       Overlap = ExampleGRF$x, method = "p")
##D wTO.export(EXAMPLE , './EXAMPLE.txt')
##D 
##D #Selection of only the significative ones for the Consensus
##D Ex_k1_cor_p_boot_p005_sig = subset(EXAMPLE$wTO,
##D EXAMPLE$wTO$pval_sig < 0.05,
##D select = c("Node.1", "Node.2", "wTO_sign"))
##D Ex_k1_cor_p_boot_p005_abs = subset(EXAMPLE$wTO,
##D EXAMPLE$wTO$pval_abs < 0.05,
##D select = c("Node.1", "Node.2", "wTO_abs"))
##D # Constructing the consensus network
##D CN = wTO.Consensus(data = list(Ex_k1_cor_p_boot_p005_sig,
##D Ex_k1_cor_p_boot_p005_abs))
##D wTO.export(CN, './CN.txt')
##D ### You can store the result on the workspace.
##D y = wTO.export(CN, './CN.txt')
##D head(y)
## End(Not run)






