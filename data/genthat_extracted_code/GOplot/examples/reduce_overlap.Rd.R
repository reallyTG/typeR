library(GOplot)


### Name: reduce_overlap
### Title: Eliminates redundant terms.
### Aliases: reduce_overlap

### ** Examples

## Not run: 
##D # Load the included dataset
##D data(EC)
##D 
##D # Building the circ object
##D circ <- circle_dat(EC$david, EC$genelist)
##D 
##D # Eliminate redundant terms
##D reduced_circ <- reduce_overlap(circ)
##D 
##D # Plot reduced data
##D GOBubble(reduced_circ)
##D 
## End(Not run)



