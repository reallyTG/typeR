library(DoE.MIParray)


### Name: mosek_MIPsearch
### Title: Functions to Search for optimum MIP Based Array Using Gurobi or
###   Mosek
### Aliases: mosek_MIPsearch gurobi_MIPsearch
### Keywords: array design

### ** Examples

## Not run: 
##D ## can also be run with gurobi_MIParray instead of mosek_MIParray
##D ## there are of course better ways to obtain good arrays for these parameters
##D ## (e.g. function FrF2 from package FrF2)
##D oa_feasible(18, c(2,3,3,3,3), 2)  ## strength 2 array feasible
##D lowerbound_AR(18, c(2,3,3,3,3), 3)  ## lower bound for A3
##D ## of course not necessary here, the design is found fast
##D feld <- mosek_MIPsearch(18, c(2,3,3,3,3), stopearly=FALSE, listout=TRUE, maxtime=30)
##D ## even stopearly=TRUE would not stop, because the lower bound 2 is not achievable
##D feld
##D names(attributes(feld))
##D attr(feld, "optorder")
##D ## even for this simple case, running optimization until confirmed optimality 
##D ## would be very slow
## End(Not run)



