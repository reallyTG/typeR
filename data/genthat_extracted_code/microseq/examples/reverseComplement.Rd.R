library(microseq)


### Name: reverseComplement
### Title: Reverse-complementation of DNA
### Aliases: reverseComplement

### ** Examples

ex.file <- file.path(file.path(path.package("microseq"),"extdata"),"small.fasta")
fdta <- readFasta(ex.file)
reverseComplement(fdta$Sequence)





