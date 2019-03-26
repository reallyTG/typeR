library(algstat)


### Name: markov
### Title: Compute a Markov Basis with 4ti2
### Aliases: markov

### ** Examples

## Not run: 
##D 
##D 
##D 
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
##D 
##D 
##D 
##D 
##D # 3x3 independence example
##D # following convention, the first index indicates rows
##D varlvls <- c(3,3)
##D facets <- list(1,2)
##D ( A <- hmat(varlvls, facets) )
##D markov(A)
##D markov(A, "vec")
##D markov(A, "tab", varlvls)
##D markov(A, "tab", varlvls, TRUE)
##D 
##D 
##D 
##D 
##D # LAS example 1.2.1, p.12 (2x3 independence)
##D varlvls <- c(2,3)
##D facets <- list(1, 2)
##D ( A <- hmat(varlvls, facets) )
##D markov(A, "tab", varlvls)
##D # Prop 1.2.2 says that there should be
##D 2*choose(2, 2)*choose(3,2) # = 6
##D # moves.
##D markov(A, "tab", varlvls, TRUE)
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
##D 
##D # LAS example 1.2.12, p.16  (no 3-way interaction)
##D varlvls <- c(2,2,2,2)
##D facets <- list(c(1,2), c(1,4), c(2,3))
##D ( A <- hmat(varlvls, facets) )
##D markov(A)
##D markov(A, "tab", varlvls) # hard to understand
##D tableau(markov(A), varlvls)
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D # using the markov bases database, must be connected to internet
##D # A <- markov(dbName = "ind3-3")
##D B <- markov(hmat(c(3,3), list(1,2)))
##D # all(A == B)
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D 
##D markov(diag(1, 10))
##D 
## End(Not run)



