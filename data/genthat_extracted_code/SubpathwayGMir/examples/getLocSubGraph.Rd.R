library(SubpathwayGMir)


### Name: getLocSubGraph
### Title: Get the located metabolic subpathways
### Aliases: getLocSubGraph
### Keywords: file

### ** Examples

## Not run: 
##D 
##D ### Integrate miRNAs to KEGG pathway graphs ###
##D 
##D ## get hsa-specificd miRNA-target interactions ##
##D  expMir2Tar <- GetK2riData(K2riData="expMir2Tar")
##D  row1 <- which(expMir2Tar[["LowTHExps"]]=="YES")
##D  row2 <- which(expMir2Tar[["Species"]]=="hsa")
##D  relations <- unique(expMir2Tar[intersect(row1,row2),c(2:3)])
##D 
##D # get user-interested miRNAs and genes sets.
##D  moleculeList <- c(getBackground(type="gene")[1:1000],
##D                  getBackground(type="miRNA")[1:2000])
##D 
##D ## get direct KEGG metabolic pathway graphs ##
##D  graphList <- GetK2riData(K2riData="MetabolicGEGEEMGraph")
##D # get reconstructed pathway graph list.
##D  InteGraphList <- getInteGraphList(graphList, relations) 
##D # get locate subpathways.
##D  subGraphList <- getLocSubGraph(moleculeList,InteGraphList,
##D                  type="gene_miRNA",n=1,s=10)
##D # visualize the located subpathways.
##D  plotGraph(subGraphList[[1]],layout=layout.random)
##D 
##D 
##D ## get undirect KEGG metabolic pathway graphs ##
##D  graphList <- GetK2riData(K2riData="MetabolicGEGEUEMGraph")
##D # get reconstructed pathway graph list.
##D  InteGraphList <- getInteGraphList(graphList, relations) 
##D # get locate subpathways.
##D  subGraphList <- getLocSubGraph(moleculeList,InteGraphList,
##D                  type="gene_miRNA",n=1,s=10)
##D # visualize the located subpathways.
##D  plotGraph(subGraphList[[1]],layout=layout.random)
## End(Not run)



