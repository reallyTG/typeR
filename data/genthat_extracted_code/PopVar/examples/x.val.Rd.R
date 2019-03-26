library(PopVar)


### Name: x.val
### Title: Estimate genome-wide prediction accuacy using cross-validation
### Aliases: x.val

### ** Examples

## Not run: 
##D ## CV using method 1 with 25 iterations
##D CV.mthd1 <- x.val(G.in = G.in_ex, y.in = y.in_ex, nCV.iter = 25)
##D CV.mthd1$CVs
##D 
##D ## CV using method 2 with 5 folds and 3 replications
##D x.val(G.in = G.in_ex, y.in = y.in_ex, nFold = 5, nFold.reps = 3)
## End(Not run)



