library(bio3d)


### Name: plot.enma
### Title: Plot eNMA Results
### Aliases: plot.enma
### Keywords: hplot

### ** Examples

## Not run: 
##D ids <- c("1a70_A", "1czp_A", "1frd_A", "1fxi_A", "1iue_A", "1pfd_A")
##D raw.files <- get.pdb(ids, path = "raw_pdbs")
##D files <- pdbsplit(raw.files, ids, path = "raw_pdbs/split_chain")
##D 
##D ## Sequence/structure alignement
##D pdbs <- pdbaln(files)
##D 
##D ## Normal mode analysis on aligned data
##D modes <- nma(pdbs)
##D 
##D ## Plot fluctuations
##D plot(modes, pdbs=pdbs)
##D 
##D ## Group and spread fluctuation profiles
##D hc <- hclust(as.dist(1-modes$rmsip))
##D col <- cutree(hc, k=2)
##D plot(modes, pdbs=pdbs, col=col, spread=TRUE)
## End(Not run)



