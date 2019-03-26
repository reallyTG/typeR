library(seqinr)


### Name: getKeyword
### Title: Generic function to get keywords associated to sequences
### Aliases: getKeyword getKeyword.default getKeyword.list
###   getKeyword.SeqAcnucWeb getKeyword.qaw getKeyword.logical
### Keywords: utilities

### ** Examples

#
# List all available methods for getKeyword generic function:
#
   methods(getKeyword)
#
# Example of keyword extraction from an ACNUC server:
#
  ## Not run: 
##D   # Need internet connection
##D   choosebank("emblTP")
##D   fc<-query("fc", "sp=felis catus et t=cds et o=mitochondrion")
##D   getKeyword(fc$req[[1]])
##D   # Should be: 
##D   # [1] "DIVISION ORG" "RELEASE 62"   "CYTOCHROME B" "SOURCE"       "CDS"
##D   closebank()  
## End(Not run)



