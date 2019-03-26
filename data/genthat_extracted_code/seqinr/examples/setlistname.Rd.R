library(seqinr)


### Name: setlistname
### Title: Sets the name of an ACNUC list identified by its rank
### Aliases: setlistname
### Keywords: utilities

### ** Examples

## Not run: 
##D  
##D   ### Need internet connection
##D   choosebank("emblTP")
##D   mylist <- query("mylist", "sp=felis catus et t=CDS", virtual = TRUE)
##D   # Change list name on server:
##D   setlistname(lrank = glr("mylist"), name = "feliscatus") # 0, OK.
##D   glr("mylist") # 0, list doesn't exist no more.
##D   glr("feliscatus") # 2, this list exists.
##D   # Note the danger here: the object mylist is still present in the user workspace
##D   # while the corresponding list was deleted from server.
##D   
## End(Not run)



