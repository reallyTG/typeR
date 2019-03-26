library(EcoGenetics)


### Name: eco.rbind
### Title: Combining ecogen objects by row
### Aliases: eco.rbind

### ** Examples


## Not run: 
##D 
##D data(eco.test)
##D 
##D # split the object "eco" into a list of ecogen objects by population
##D x <- eco.split(eco, "pop", asList = TRUE)
##D 
##D # re-bind the objects
##D eco.r <- eco.rbind(eco)
##D 
##D # create a new objects with the first and second population
##D eco.r <- eco.rbind(x[[1]], x[[3]])
##D 
##D # duplicated row names are not allowed by eco.rbind with default options
##D eco2 <- eco
##D eco.rbind(eco, eco2)
##D 
##D eco.rbind(eco, eco2,check_rownames = FALSE)
## End(Not run)




