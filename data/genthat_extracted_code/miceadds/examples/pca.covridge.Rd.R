library(miceadds)


### Name: pca.covridge
### Title: Principal Component Analysis with Ridge Regularization
### Aliases: pca.covridge
### Keywords: Dimension reduction Principal component analysis

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: PCA on imputed internet data
##D #############################################################################
##D 
##D library(mice)
##D data(data.internet)
##D dat <- as.matrix( data.internet)
##D 
##D # single imputation in mice
##D imp <- mice::mice( dat, m=1, maxit=10 )
##D 
##D # apply PCA
##D pca.imp <- miceadds::pca.covridge( complete(imp) )
##D   ##   > pca.imp$sdev
##D   ##      Comp.1    Comp.2    Comp.3    Comp.4    Comp.5    Comp.6    Comp.7
##D   ##   3.0370905 2.3950176 2.2106816 2.0661971 1.8252900 1.7009921 1.6379599
##D 
##D # compare results with princomp
##D pca2.imp <- stats::princomp( complete(imp) )
##D   ##   > pca2.imp
##D   ##   Call:
##D   ##   stats::princomp(x=complete(imp))
##D   ##
##D   ##   Standard deviations:
##D   ##      Comp.1    Comp.2    Comp.3    Comp.4    Comp.5    Comp.6    Comp.7
##D   ##   3.0316816 2.3907523 2.2067445 2.0625173 1.8220392 1.6979627 1.6350428
## End(Not run)



