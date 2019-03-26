library(Seurat)


### Name: JackStraw
### Title: Determine statistical significance of PCA scores.
### Aliases: JackStraw

### ** Examples

## Not run: 
##D pbmc_small = suppressWarnings(JackStraw(pbmc_small))
##D head(pbmc_small@dr$pca@jackstraw@emperical.p.value)
## End(Not run)




