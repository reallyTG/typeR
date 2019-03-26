library(Rknots)


### Name: skeinIterator
### Title: Iterate the skein relation to build a skein tree of a polygonal
###   link
### Aliases: skeinIterator
### Keywords: invariants

### ** Examples

	protein <- makeExampleProtein()
	protein <- AlexanderBriggs(protein$A)

	## Compute the skein tree
	tree <- skeinIterator(protein$points3D, protein$ends)
	str(tree)



