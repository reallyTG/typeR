library(protr)


### Name: parSeqSim
### Title: Parallellized Protein Sequence Similarity Calculation based on
###   Sequence Alignment
### Aliases: parSeqSim
### Keywords: alignment parallel similarity

### ** Examples

## Not run: 
##D # Be careful when testing this since it involves parallelisation
##D # and might produce unpredictable results in some environments
##D 
##D library("Biostrings")
##D library("foreach")
##D library("doParallel")
##D 
##D s1 = readFASTA(system.file("protseq/P00750.fasta", package = "protr"))[[1]]
##D s2 = readFASTA(system.file("protseq/P08218.fasta", package = "protr"))[[1]]
##D s3 = readFASTA(system.file("protseq/P10323.fasta", package = "protr"))[[1]]
##D s4 = readFASTA(system.file("protseq/P20160.fasta", package = "protr"))[[1]]
##D s5 = readFASTA(system.file("protseq/Q9NZP8.fasta", package = "protr"))[[1]]
##D plist = list(s1, s2, s3, s4, s5)
##D psimmat = parSeqSim(plist, cores = 2, type = "local", submat = "BLOSUM62")
##D print(psimmat)
## End(Not run)



