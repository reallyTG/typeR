library(dimRed)


### Name: reconstruction_error,dimRedResult-method
### Title: Method reconstruction_error
### Aliases: reconstruction_error,dimRedResult-method reconstruction_error

### ** Examples

## Not run: 
##D ir <- loadDataSet("Iris")
##D ir.drr <- embed(ir, "DRR", ndim = ndims(ir))
##D ir.pca <- embed(ir, "PCA", ndim = ndims(ir))
##D 
##D rmse <- data.frame(
##D   rmse_drr = reconstruction_error(ir.drr),
##D   rmse_pca = reconstruction_error(ir.pca)
##D )
##D 
##D matplot(rmse, type = "l")
##D plot(ir)
##D plot(ir.drr)
##D plot(ir.pca)
## End(Not run)



