library(Rknots)


### Name: closeAndProject
### Title: Close the protein backbone and perform a Principal Component
###   Analysis (requires an object of class 'Knot')
### Aliases: closeAndProject
### Keywords: proteins

### ** Examples

## Not run: 
##D ## Loading from the file system
##D fn <- system.file("extdata", "1AJC_chainA.pdb", package="Rknots")
##D protein <- loadProtein(fn)
##D protein <- newKnot(protein$A)
##D protein.cp <- closeAndProject(protein)
##D 
##D # Plot the results
##D par(mfrow = c(1,2))        
##D plot(protein, lwd = 2)    
##D plot(protein.cp, lwd = 2)
## End(Not run)



