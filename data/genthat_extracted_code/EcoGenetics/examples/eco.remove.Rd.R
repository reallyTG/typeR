library(EcoGenetics)


### Name: eco.remove
### Title: Creating an updated ecogen object by removing results of the
###   slot OUT
### Aliases: eco.remove

### ** Examples


## Not run: 
##D 
##D data(eco.test)
##D variog <- eco.variogram(eco[["P"]][, 1], eco[["XY"]])
##D 
##D # the assignment of values can be made with the corresponding accessors,
##D # using the generic notation of EcoGenetics 
##D # (<ecoslot.> + <name of the slot> + <name of the object>).
##D # See help("EcoGenetics accessors")
##D 
##D ecoslot.OUT(eco) <- variog         
##D we.are.numbers <- c(1:10)
##D we.are.characters <- c("John Coltrane", "Charlie Parker")
##D ecoslot.OUT(eco) <- list(we.are.numbers, we.are.characters)
##D ecoslot.OUT(eco)
##D eco <- eco.remove(eco, we.are.numbers)
##D ecoslot.OUT(eco)
##D 
## End(Not run)




