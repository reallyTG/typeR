library(seqinr)


### Name: query
### Title: To get a list of sequence names from an ACNUC data base located
###   on the web
### Aliases: query
### Keywords: utilities

### ** Examples

 ## Not run: 
##D  # Need internet connection
##D  choosebank("genbank")
##D  bb <- query("bb", "sp=Borrelia burgdorferi")
##D  # To get the names of the 4 first sequences:
##D  sapply(bb$req[1:4], getName)
##D  # To get the 4 first sequences:
##D  sapply(bb$req[1:4], getSequence, as.string = TRUE) 
##D  
## End(Not run)



