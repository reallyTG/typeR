library(EcoGenetics)


### Name: eco.split
### Title: Splitting an ecogen object by group
### Aliases: eco.split

### ** Examples

## Not run: 
##D data(eco3)
##D eco3
##D 
##D 
##D # list of objects
##D x <- eco.split(eco3, "structure", asList = TRUE)
##D 
##D 
##D # rebinding
##D eco.bind <- eco.rbind(x)
##D 
##D 
##D # note that different subsets can also be created
##D S1.3 <- eco.rbind(x[[1]], x[[3]])
##D 
##D 
##D # split and create objects with prefix "eco3"
##D eco.split(eco3,"structure", asList = FALSE)
##D 
##D 
##D # split and create objects with prefix "newObjects"
##D eco.split(eco3,"structure", "newObjects", asList = FALSE) 
##D 
##D 
##D 
## End(Not run)




