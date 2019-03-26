library(cocoreg)


### Name: data_matrix_rmse
### Title: Compute RMSE between data.matrices dm1 and dm2
### Aliases: data_matrix_rmse

### ** Examples

## Not run: 
##D  dm1 <- matrix(rep(1,6),nrow=2)
##D  dm2 <- matrix(rep(3,6),nrow=2)
##D  data_matrix_rmse(dm1, dm2)
##D  
##D  first = list(dm1, dm1)
##D  second = list(dm2, dm2)
##D  (tmp = mapply(data_matrix_rmse, first, second, SIMPLIFY=FALSE))
##D  
## End(Not run)




