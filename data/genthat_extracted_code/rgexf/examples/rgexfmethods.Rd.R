library(rgexf)


### Name: rgexf Methods
### Title: S3 methods for 'gexf' objects
### Aliases: print.gexf export-gexf plot.gexf summary.gexf
### Keywords: methods

### ** Examples

  ## Not run: 
##D     # Data frame of nodes
##D     people <- data.frame(id=1:4, label=c("juan", "pedro", "matthew", "carlos"),
##D                      stringsAsFactors=F)
##D     
##D     # Data frame of edges
##D     relations <- data.frame(source=c(1,1,1,2,3,4,2,4,4), 
##D                         target=c(4,2,3,3,4,2,4,1,1))
##D     
##D     # Building gexf graph
##D     mygraph <- write.gexf(nodes=people, edges=relations)
##D     
##D     # Summary and pring
##D     summary(mygraph)
##D     
##D     print(mygraph, file="mygraph.gexf", replace=T)
##D     
##D     # Plotting
##D     plot(mygraph)
##D     
##D   
## End(Not run)



