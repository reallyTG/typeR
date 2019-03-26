library(alakazam)


### Name: buildPhylipLineage
### Title: Infer an Ig lineage using PHYLIP
### Aliases: buildPhylipLineage

### ** Examples

## Not run: 
##D # Preprocess clone
##D db <- subset(ExampleDb, CLONE == 3138)
##D clone <- makeChangeoClone(db, text_fields=c("SAMPLE", "ISOTYPE"), 
##D                           num_fields="DUPCOUNT")
##D 
##D # Run PHYLIP and process output
##D dnapars_exec <- "~/apps/phylip-3.69/dnapars"
##D graph <- buildPhylipLineage(clone, dnapars_exec, rm_temp=TRUE)
##D 
##D # Plot graph with a tree layout
##D library(igraph)
##D plot(graph, layout=layout_as_tree, vertex.label=V(graph)$ISOTYPE, 
##D      vertex.size=50, edge.arrow.mode=0, vertex.color="grey80")
##D 
##D # To consider each indel event as a mutation, change the masking character 
##D # and distance matrix
##D clone <- makeChangeoClone(db, text_fields=c("SAMPLE", "ISOTYPE"), 
##D                           num_fields="DUPCOUNT", mask_char="-")
##D graph <- buildPhylipLineage(clone, dnapars_exec, dist_mat=getDNAMatrix(gap=-1), 
##D                             rm_temp=TRUE)
## End(Not run)




