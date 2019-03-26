library(seqinr)


### Name: modifylist
### Title: Modification of an ACNUC list
### Aliases: modifylist
### Keywords: utilities

### ** Examples

## Not run: 
##D  # Need internet connection
##D   choosebank("emblTP")
##D   mylist <- query("mylist", "sp=felis catus et t=cds", virtual=TRUE)
##D   mylist$nelem # 603 sequences
##D   stopifnot(mylist$nelem == 603)
##D 
##D   # select sequences with at least 1000 bp:
##D   mylist <- modifylist("mylist", operation = ">1000", virtual = TRUE)
##D   mylist$nelem # now, only 132 sequences
##D   stopifnot(mylist$nelem == 132)
##D 
##D   # scan for "felis" in annotations:
##D   mylist <- modifylist("mylist", op = "felis", type = "scan", virtual = TRUE)
##D   mylist$nelem # now, only 33 sequences
##D   stopifnot(mylist$nelem == 33)
##D 
##D   # modify by date:
##D   mylist <-  modifylist("mylist", op = "> 1/jul/2001", type = "date", virtual = TRUE)
##D   mylist$nelem # now, only 15 sequences
##D   stopifnot(mylist$nelem == 15)
##D 
##D   # Summary of current ACNUC lists, one list called MYLIST on sever:
##D   sapply(alr()$rank, getliststate)
##D   closebank()
##D   
## End(Not run)



