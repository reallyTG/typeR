library(seqinr)


### Name: getName
### Title: Generic function to get the names of sequences
### Aliases: getName getName.default getName.list getName.SeqFrag
###   getName.SeqAcnucWeb getName.SeqFastadna getName.SeqFastaAA
###   getName.qaw getName.logical
### Keywords: utilities

### ** Examples

#
# List all available methods for getName generic function:
#
   methods(getName)
#
# Example with seven DNA sequences from a FASTA file:
#
  ff <- system.file("sequences/someORF.fsa", package = "seqinr")
  fs <- read.fasta(file = ff)
  stopifnot(all(getName(fs) == c("YAL001C", "YAL002W", "YAL003W",
    "YAL005C", "YAL007C", "YAL008W", "YAL009W")))
#
# Example with 49 sequences from an ACNUC server:
#
  ## Not run: 
##D   # Need internet connection
##D   choosebank("emblTP")
##D   fc <- query("fc", "sp=felis catus et t=cds et o=mitochondrion")
##D   getName(fc)
##D   closebank()  
## End(Not run)



