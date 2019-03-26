library(session)


### Name: save.session
### Title: Save and restore session information, including loaded packages
###   and attached data objects.
### Aliases: save.session restore.session
### Keywords: data programming

### ** Examples


  ls(all=TRUE) # show all data objects
  search()  # list search path

  # save the current R session to the file "RSession.Rda"
  save.session("RSession.Rda")

  ## Not run: 
##D   # exit R without saving data
##D   q("no")
##D 
##D   # restart R
##D   R 
##D   
## End(Not run)

  # load a saved R session from "RSession.Rda"
  restore.session("RSession.Rda")

  ls(all=TRUE) # show all data objects
  search()  # list search path




