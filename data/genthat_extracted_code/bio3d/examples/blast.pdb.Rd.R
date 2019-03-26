library(bio3d)


### Name: blast.pdb
### Title: NCBI BLAST Sequence Search and Summary Plot of Hit Statistics
### Aliases: blast.pdb get.blast plot.blast
### Keywords: utilities hplot

### ** Examples

## Not run: 
##D pdb <- read.pdb("4q21")
##D blast <- blast.pdb( pdbseq(pdb) )
##D 
##D head(blast$hit.tbl)
##D top.hits <- plot(blast)
##D head(top.hits$hits)
##D 
##D ## Use 'get.blast()' to retrieve results at a later time.
##D #x <- get.blast(blast$url)
##D #head(x$hit.tbl)
##D 
##D # Examine and download 'best' hits
##D top.hits <- plot.blast(blast, cutoff=188)
##D head(top.hits$hits)
##D #get.pdb(top.hits)
## End(Not run)



