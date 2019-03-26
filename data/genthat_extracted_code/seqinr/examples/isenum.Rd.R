library(seqinr)


### Name: isenum
### Title: Get the ACNUC number of a sequence from its name or accession
###   number
### Aliases: isenum isn getNumber.socket getAttributsocket
### Keywords: utilities

### ** Examples

## Not run: 
##D  
##D   ### Need internet connection
##D   choosebank("emblTP")
##D   isenum("LMFLCHR36")
##D   isn("LMFLCHR36")
##D   stopifnot(isn("LMFLCHR36") == 13682678)
##D   # Example with CDS:
##D   isenum("AB004237")
##D   
## End(Not run)



