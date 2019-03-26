library(seqinr)


### Name: getFrag
### Title: Generic function to extract sequence fragments
### Aliases: getFrag getFrag.default getFrag.list getFrag.character
###   getFrag.SeqFrag getFrag.SeqAcnucWeb getFrag.SeqFastadna
###   getFrag.SeqFastaAA getFrag.qaw getFrag.logical
### Keywords: utilities

### ** Examples

#
# List all available methods for getFrag generic function:
#
   methods(getFrag)
#
# Example with a DNA sequence from a FASTA file:
#
  dnafile <- system.file("sequences/malM.fasta", package = "seqinr")
  sfdna <- read.fasta(file = dnafile)
  myfrag <- getFrag(sfdna[[1]], begin = 1, end = 10)
  stopifnot(getSequence(myfrag, as.string = TRUE) == "atgaaaatga")



