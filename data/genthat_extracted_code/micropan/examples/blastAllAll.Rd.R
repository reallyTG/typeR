library(micropan)


### Name: blastAllAll
### Title: Making BLAST search all against all genomes
### Aliases: blastAllAll

### ** Examples

## Not run: 
##D # This example requires the external BLAST+ software
##D # Using protein files in this package
##D xpth <- file.path(path.package("micropan"),"extdata")
##D prot.files <- file.path(xpth,c("Example_proteins_GID1.fasta.xz",
##D                                "Example_proteins_GID2.fasta.xz",
##D                                "Example_proteins_GID3.fasta.xz"))
##D 
##D # We need to uncompress them first...
##D tf <- tempfile(fileext=c("GID1.fasta.xz","GID2.fasta.xz","GID3.fasta.xz"))
##D s <- file.copy(prot.files,tf)
##D tf <- unlist(lapply(tf,xzuncompress))
##D 
##D # Blasting all versus all...(requires BLAST+)
##D tmp.dir <- tempdir()
##D blastAllAll(tf,out.folder=tmp.dir)
##D 
##D # Reading results, and computing blast.distances
##D blast.files <- dir(tmp.dir,pattern="GID[0-9]+_vs_GID[0-9]+.txt")
##D blast.distances <- bDist(file.path(tmp.dir,blast.files))
##D 
##D # ...and cleaning tmp.dir...
##D s <- file.remove(tf)
##D s <- file.remove(file.path(tmp.dir,blast.files))
## End(Not run)




