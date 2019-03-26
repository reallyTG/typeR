library(Seurat)


### Name: FindConservedMarkers
### Title: Finds markers that are conserved between the two groups
### Aliases: FindConservedMarkers

### ** Examples

## Not run: 
##D pbmc_small
##D # Create a simulated grouping variable
##D pbmc_small@meta.data$groups <- sample(
##D   x = c("g1", "g2"),
##D   size = length(x = pbmc_small@cell.names),
##D   replace = TRUE
##D )
##D FindConservedMarkers(pbmc_small, ident.1 = 0, ident.2 = 1, grouping.var = "groups")
## End(Not run)




