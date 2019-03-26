library(tabula)


### Name: seriation
### Title: Matrix seriation
### Aliases: seriation refine refine-method seriate seriate-method permute
###   permute-method refine,CountMatrix-method seriate,CountMatrix-method
###   seriate,IncidenceMatrix-method
###   permute,CountMatrix,PermutationOrder-method
###   permute,IncidenceMatrix,PermutationOrder-method

### ** Examples

## Not run: 
##D 
##D # Refine matrix seriation (this is a long running example)
##D # Reproduces Peeples and Schachner 2012 results
##D count <- as(zuni, "CountMatrix")
##D 
##D ## Samples with convex hull maximum dimension length greater than the cutoff
##D ## value will be marked for removal.
##D ## Define cutoff as one standard deviation above the mean
##D fun <- function(x) { mean(x) + sd(x) }
##D 
##D ## Get indices of samples to be kept
##D ## Warning: this may take a few seconds!
##D refined <- refine(count, cutoff = fun)
##D refined[["keep"]]
##D 
##D # Matrix seriation
##D # Reproduces Desachy 2004 results
##D ## Coerce dataset to abundance matrix
##D count <- as(compiegne, "CountMatrix")
##D 
##D ## Plot new matrix
##D plotBar(count, EPPM = TRUE)
##D 
##D ## Get seriation order for columns on EPPM using the reciprocal averaging method
##D ## Expected column order: N, A, C, K, P, L, B, E, I, M, D, G, O, J, F, H
##D indices <- seriate(count, method = "reciprocal", EPPM = TRUE, margin = 2)
##D 
##D ## Permute columns
##D new <- permute(count, indices)
##D 
##D ## Plot new matrix
##D plotBar(new, EPPM = TRUE)
## End(Not run)



