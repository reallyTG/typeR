library(seqinr)


### Name: countsubseqs
### Title: Number of subsequences in an ACNUC list
### Aliases: countsubseqs css
### Keywords: utilities

### ** Examples

## Not run: 
##D  # Need internet connection
##D   choosebank("emblTP")
##D   mylist<-query("mylist", "N=@", virtual = TRUE) # select all (seqs + subseqs)
##D   mylist$nelem   # 14138094 seqs + subseqs
##D   stopifnot(mylist$nelem == 14138094)
##D   css(glr("mylist")) # 1604500 subsequences only
##D   stopifnot(css(glr("mylist")) == 1604500)
##D   closebank()
##D   
## End(Not run)



