library(algstat)


### Name: tableau
### Title: Tableau Notation for Markov
### Aliases: tableau

### ** Examples

## Not run: 
##D 
##D # 2x2 independence example
##D # following convention, the first index indicates rows
##D varlvls <- c(2,2)
##D facets <- list(1,2)
##D ( A <- hmat(varlvls, facets) )
##D markov(A)
##D markov(A, "vec")
##D markov(A, "tab", varlvls)
##D markov(A, "tab", varlvls, TRUE)
##D tableau(markov(A), varlvls)
##D 
##D 
##D 
##D 
##D 
##D 
##D # LAS example 1.2.12, p.17  (no 3-way interaction)
##D varlvls <- c(2,2,2)
##D facets <- list(c(1,2), c(1,3), c(2,3))
##D ( A <- hmat(varlvls, facets) )
##D markov(A)
##D 
##D 
##D 
##D 
##D 
## End(Not run)



