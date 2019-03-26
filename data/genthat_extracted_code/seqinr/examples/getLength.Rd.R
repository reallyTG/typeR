library(seqinr)


### Name: getLength
### Title: Generic function to get the length of sequences
### Aliases: getLength getLength.default getLength.list getLength.character
###   getLength.SeqFrag getLength.SeqAcnucWeb getLength.SeqFastadna
###   getLength.SeqFastaAA getLength.qaw getLength.logical
### Keywords: utilities

### ** Examples

#
# List all available methods for getLength generic function:
#
   methods(getLength)
#
# Example with seven DNA sequences from a FASTA file:
#
  ff <- system.file("sequences/someORF.fsa", package = "seqinr")
  fs <- read.fasta(file = ff)
  stopifnot(all(getLength(fs) == c(5573, 5825, 2987, 3929, 2648, 2597, 2780)))
#
# Example with 49 sequences from an ACNUC server:
#
  ## Not run: 
##D   # Need internet connection
##D   choosebank("emblTP")
##D   fc <- query("fc", "sp=felis catus et t=cds et o=mitochondrion")
##D   getLength(fc)
##D   closebank()  
## End(Not run)



