library(seqinr)


### Name: getLocation
### Title: Generic function to get the location of subsequences on the
###   parent sequence
### Aliases: getLocation getLocation.default getLocation.list
###   getLocation.SeqAcnucWeb getLocation.qaw getLocation.logical
### Keywords: utilities

### ** Examples

#
# List all available methods for getLocation generic function:
#
   methods(getLocation)
#
# Example with a subsequence from an ACNUC server:
#
  ## Not run: 
##D   # Need internet connection
##D   choosebank("emblTP")
##D   fc <- query("fc", "sp=felis catus et t=cds et o=mitochondrion")
##D   getLocation(fc$req[[5]])
##D   closebank()  
## End(Not run)



