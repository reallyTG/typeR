library(seqinr)


### Name: getAnnot
### Title: Generic Function to get sequence annotations
### Aliases: getAnnot getAnnot.default getAnnot.list getAnnot.SeqAcnucWeb
###   getAnnot.SeqFastadna getAnnot.SeqFastaAA getAnnot.qaw
###   getAnnot.logical readAnnots.socket
### Keywords: utilities

### ** Examples

#
# List all available methods for getAnnot generic function:
#
   methods(getAnnot)
#
# SeqAcnucWeb class example:
#
  ## Not run: 
##D   # Need internet connection
##D   choosebank("emblTP")
##D   fc<-query("fc", "sp=felis catus et t=cds et O=mitochondrion et Y>2001 et no k=partial")
##D   # get the first 5 lines annotating the first sequence:
##D   annots <- getAnnot(fc$req[[1]], nbl = 5)
##D   cat(annots, sep = "\n")
##D   # or use the list method to get them all at once:
##D   annots <- getAnnot(fc$req, nbl = 5)
##D   cat(annots, sep = "\n")
##D   closebank()
##D   
## End(Not run)
#
# SeqFastaAA class example:
#
   aafile <- system.file("sequences/seqAA.fasta", package = "seqinr")
   sfaa <- read.fasta(aafile, seqtype = "AA")
   getAnnot(sfaa[[1]])
#
# SeqFastadna class example:
#
   dnafile <- system.file("sequences/malM.fasta", package = "seqinr")
   sfdna <- read.fasta(file = dnafile)
   getAnnot(sfdna[[1]])
#
# Example with a FASTA file with multiple entries:
#
  ff <- system.file("sequences/someORF.fsa", package = "seqinr")
  fs <- read.fasta(ff)
  getAnnot(fs) # the list method is used here to get them all at once
#
# Default getAnnot method example. An error is produced because 
# there are no annotations by default:
#
   result <- try(getAnnot(letters))
   stopifnot(!inherits("result", "try-error"))



