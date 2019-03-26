library(seqinr)


### Name: prepgetannots
### Title: Select annotation lines in an ACNUC database
### Aliases: prepgetannots pga
### Keywords: utilities

### ** Examples

 ## Not run: 
##D # Need internet connection
##D   choosebank("genbank")
##D   mylist <- query("mylist","n=AQF16SRRN")
##D   pga() # We want to scan all annotations, including FEATURES
##D   mylist <- modifylist("mylist", operation = "strain", type = "scan")
##D   mylist$nelem # should be 1
##D  
## End(Not run)



