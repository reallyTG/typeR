library(DoE.MIParray)


### Name: mosek_MIParray
### Title: Functions to Create a MIP Based Array Using Gurobi or Mosek
### Aliases: mosek_MIParray gurobi_MIParray
### Keywords: array design

### ** Examples

## Not run: 
##D ## can also be run with gurobi_MIParray instead of mosek_MIParray
##D ## there are of course better ways to obtain good arrays for these parameters
##D ## (e.g. function FrF2 from package FrF2)
##D feld <- mosek_MIParray(16, rep(2,7), resolution=3, kmax=4)
##D feld
##D names(attributes(feld))
##D attr(feld, "MIPinfo")$info
##D 
##D ## using a start value
##D start <- DoE.base::L16.2.8.8.1[,1:5]
##D feld <- mosek_MIParray(16, rep(2,5), resolution=4, start=start)
##D 
##D ## counting vector representation of the start value could also be used
##D DoE.MIParray:::dToCount(start-1)
##D    ## "-1", because the function requires values starting with 0
##D    ## 32 elements for the full factorial in lexicographic order, 16 ones for the runs
##D 
##D ## extending an existing array
##D force <- matrix(as.numeric(as.matrix(DoE.base::undesign(DoE.base::oa.design(L8.2.7)))), nrow=8)
##D feld <- mosek_MIParray(16, rep(2,7), resolution=3, kmax=4, forced=force)
##D attr(feld, "MIPinfo")$info
## End(Not run)



