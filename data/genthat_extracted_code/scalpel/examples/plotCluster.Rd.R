library(scalpel)


### Name: plotCluster
### Title: Plot a summary of a given cluster from Step 2 of SCALPEL.
### Aliases: plotCluster

### ** Examples

## Not run: 
##D ### many of the functions in this package are interconnected so the
##D ### easiest way to learn to use the package is by working through the vignette,
##D ### which is available at ajpete.com/software
##D 
##D #assumes you have run the example for the "scalpel" function
##D #plots the cluster for the 2nd dictionary element (i.e., scalpelOutput$A[,2])
##D plotCluster(scalpelOutput = scalpelOutput, AIndex = 2)
##D #plots the cluster for the 2nd component included in SGL (i.e., scalpelOutput$Afilter[,2])
##D plotCluster(scalpelOutput = scalpelOutput, AfilterIndex = 2)
## End(Not run)



