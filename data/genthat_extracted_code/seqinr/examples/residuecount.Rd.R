library(seqinr)


### Name: residuecount
### Title: Total number of residues in an ACNUC list
### Aliases: residuecount
### Keywords: utilities

### ** Examples

## Not run: 
##D  
##D   ### Need internet connection
##D   choosebank("emblTP")
##D   mylist <- query("mylist", "t=CDS", virtual = TRUE)
##D   stopifnot(residuecount(glr("mylist")) == 1611439240)
##D   stopifnot(is.na(residuecount(glr("unknowlist")))) # A warning is issued
##D   
## End(Not run)



