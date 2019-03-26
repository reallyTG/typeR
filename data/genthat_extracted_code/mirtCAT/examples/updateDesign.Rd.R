library(mirtCAT)


### Name: updateDesign
### Title: Update design elements
### Aliases: updateDesign

### ** Examples

## Not run: 
##D # test defined in mirtCAT help file, first example
##D CATdesign <- mirtCAT(df, mod, criteria = 'MI', design_elements = TRUE)
##D 
##D # returns number 1 in this case, since that's the starting item
##D findNextItem(CATdesign) 
##D 
##D # determine next item if item 1 and item 10 were answered correctly, and Theta = 0.5
##D CATdesign <- updateDesign(CATdesign, items = c(1, 10), responses = c(1, 1), Theta = 0.5)
##D findNextItem(CATdesign) 
##D 
##D # alternatively, update the Theta using the Update.thetas definition in design
##D CATdesign$design@Update.thetas(CATdesign$design, CATdesign$person, CATdesign$test) 
##D findNextItem(CATdesign)
## End(Not run)




