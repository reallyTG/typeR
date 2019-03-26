library(microseq)


### Name: msaTrim
### Title: Trimming multiple sequence alignments
### Aliases: msaTrim

### ** Examples

## Not run: 
##D msa.file <- file.path(file.path(path.package("microseq"),"extdata"),"msa.fasta")
##D msa <- readFasta(msa.file)
##D print(nchar(msa$Sequence))
##D msa.trimmed <- msaTrim(msa)
##D print(nchar(msa.trimmed$Sequence))
## End(Not run)




