library(microseq)


### Name: translate
### Title: Translation according to the standard genetic code
### Aliases: translate

### ** Examples

ex.file <- file.path(file.path(path.package("microseq"),"extdata"),"small.fasta")
fdta <- readFasta(ex.file)
translate(fdta$Sequence)




