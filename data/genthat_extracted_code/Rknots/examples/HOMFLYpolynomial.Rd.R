library(Rknots)


### Name: HOMFLYpolynomial
### Title: Compute the HOMFLY polynomial of a polygonal link
### Aliases: HOMFLYpolynomial
### Keywords: invariants

### ** Examples

## Not run: 
##D ## Import a PDB file from the file system
##D protein <- makeExampleProtein()
##D 
##D ## Reduce to minimal structure
##D protein.reduced <- AlexanderBriggs(protein$A)
##D 
##D ## Compute the skein tree
##D tree <- skeinIterator(protein.reduced$points3D, protein.reduced$ends)
##D 	
##D ## Compute the HOMFLY polynomial
##D HOMFLYpolynomial(tree$leaves, tree$tree, skein.sign = -1)
## End(Not run)



