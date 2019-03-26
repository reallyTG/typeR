library(seqinr)


### Name: getSequence
### Title: Generic function to get sequence data
### Aliases: getSequence getSequence.default getSequence.list
###   getSequence.character getSequence.SeqFrag getSequence.SeqAcnucWeb
###   getSequence.SeqFastadna getSequence.SeqFastaAA getSequence.qaw
###   getSequence.logical
### Keywords: utilities

### ** Examples

#
# List all available methods for getSequence generic function:
#
   methods(getSequence)
#
# SeqAcnucWeb class example:
#
  ## Not run: 
##D # Need internet connection
##D   choosebank("emblTP")
##D   fc <- query("fc", "sp=felis catus et t=cds et o=mitochondrion")
##D   getSequence(fc$req[[1]])
##D   getSequence(fc$req[[1]], as.string = TRUE)
##D   closebank()
##D   
## End(Not run)
#
# SeqFastaAA class example:
#
  aafile <- system.file("sequences/seqAA.fasta", package = "seqinr")
  sfaa <- read.fasta(aafile, seqtype = "AA")
  getSequence(sfaa[[1]])
  getSequence(sfaa[[1]], as.string = TRUE)
#
# SeqFastadna class example:
#
  dnafile <- system.file("sequences/someORF.fsa", package = "seqinr")
  sfdna <- read.fasta(file = dnafile)
  getSequence(sfdna[[1]])
  getSequence(sfdna[[1]], as.string = TRUE)
#
# SeqFrag class example:
#
  sfrag <- getFrag(object = sfdna[[1]], begin = 1, end = 10)
  getSequence(sfrag)
  getSequence(sfrag, as.string = TRUE)



