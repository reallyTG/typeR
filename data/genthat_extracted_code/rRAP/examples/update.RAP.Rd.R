library(rRAP)


### Name: update.RAP
### Title: Update sparsity parameter and regression coefficients
### Aliases: update.RAP

### ** Examples

  # Recreate Figure 1 from 
  library(lars)
  data(diabetes)
  Data = cbind(diabetes$y, diabetes$x)
  # initialize RAP object
  R = RAP(X = matrix(diabetes$x[1,], nrow=1), y = diabetes$y[1], r = .995, eps = 0.0005, l0 = .1)
  # iteratively update:
  ## Not run: 
##D   for (i in 2:nrow(Data)){
##D     R = update.RAP(object=R, Ynew = diabetes$y[i], Xnew=matrix(diabetes$x[i,], nrow=1))
##D   }
##D   
## End(Not run)



