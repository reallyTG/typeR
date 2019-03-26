library(SubpathwayGMir)


### Name: getInteGraphList
### Title: Get the reconstructed metabolic pathway graphs
### Aliases: getInteGraphList
### Keywords: file

### ** Examples

## Not run: 
##D 
##D ### Integrate miRNAs into KEGG pathway graphs ###
##D 
##D ## get hsa-specificd miRNA-target interactions ##
##D  expMir2Tar <- GetK2riData(K2riData="expMir2Tar")
##D  row1 <- which(expMir2Tar[["LowTHExps"]]=="YES")
##D  row2 <- which(expMir2Tar[["Species"]]=="hsa")
##D  relations <- unique(expMir2Tar[intersect(row1,row2),c(2:3)])
##D 
##D ## get direct KEGG metabolic pathway graphs ## 
##D  graphList <- GetK2riData(K2riData="MetabolicGEGEEMGraph")
##D # get reconstructed pathway graph list #
##D  InteGraphList <- getInteGraphList(graphList, relations) 
##D # visualize the reconstructed pathways #
##D  plotGraph(InteGraphList[[1]],layout=layout.random)
##D 
##D ## get undirect KEGG metabolic pathway graphs ##
##D  graphList <- GetK2riData(K2riData="MetabolicGEGEUEMGraph")
##D # get reconstructed pathway graph list #
##D  InteGraphList <- getInteGraphList(graphList, relations) 
##D # visualize the reconstructed pathways #
##D  plotGraph(InteGraphList[[1]],layout=layout.random)
##D  
## End(Not run)



