library(seqinr)


### Name: SeqAcnucWeb
### Title: Sequence coming from a remote ACNUC data base
### Aliases: SeqAcnucWeb as.SeqAcnucWeb is.SeqAcnucWeb
### Keywords: utilities

### ** Examples

  ## Not run: 
##D # Need internet connection
##D   choosebank("emblTP")
##D   mylist <- query("mylist", "sp=felis catus et t=cds et o=mitochondrion")
##D   stopifnot(is.SeqAcnucWeb(mylist$req[[1]]))
##D   closebank()
## End(Not run)



