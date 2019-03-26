library(SubpathwayGMir)


### Name: printGraph
### Title: Print the results of graph annotation and identification
### Aliases: printGraph
### Keywords: file

### ** Examples

## Not run: 
##D 
##D # get hsa-specificd miRNA-target interactions 
##D  expMir2Tar <- GetK2riData(K2riData="expMir2Tar")
##D  row1 <- which(expMir2Tar[["LowTHExps"]]=="YES")
##D  row2 <- which(expMir2Tar[["Species"]]=="hsa")
##D  relations <- unique(expMir2Tar[intersect(row1,row2),c(2:3)])
##D 
##D # get direct KEGG metabolic pathway graphs 
##D  graphList <- GetK2riData(K2riData="MetabolicGEGEEMGraph")
##D 
##D # get reconstructed pathway graph list.
##D  InteGraphList <- getInteGraphList(graphList, relations) 
##D 
##D # get user-interested miRNAs and genes sets.
##D  moleculeList <- c(getBackground(type="gene")[1:1000],
##D                   getBackground(type="miRNA")[1:2000])
##D 				  
##D # get locate subpathways.
##D  subGraphList <- getLocSubGraph(moleculeList,InteGraphList,
##D                  type="gene_miRNA",n=1,s=10)
##D 				 
##D # annotate and identify subpathways.
##D  ann <- identifyGraph(moleculeList,subGraphList,type="gene_miRNA")
##D 
##D # convert ann to a data frame.
##D  result <- printGraph(ann,detail=TRUE)
##D 
##D # save the result.
##D  write.table(head(result),"result.txt",sep="\t",col.names=TRUE,row.names=FALSE)
##D 
## End(Not run)



