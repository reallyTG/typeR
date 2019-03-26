library(adegenet)


### Name: as methods in adegenet
### Title: Converting genind/genpop objects to other classes
### Aliases: as-method as,genind,data.frame-method
###   as,genpop,data.frame-method as,genind,matrix-method
###   as,genpop,matrix-method as,genind,genpop-method ktab-class
###   as,genind,ktab-method as,genpop,ktab-method
###   coerce,genind,data.frame-method coerce,genpop,data.frame-method
###   coerce,genind,matrix-method coerce,genpop,matrix-method
###   coerce,genind,genpop-method coerce,genind,ktab-method
###   coerce,genpop,ktab-method as.data.frame.genind as.data.frame.genpop
###   as.matrix.genind as.matrix.genpop as.genpop.genind as.ktab.genind
###   as.ktab.genpop
### Keywords: methods

### ** Examples

## Not run: 
##D data(microbov)
##D x <- tab(microbov,NA.method="mean")
##D as(x[1:3],"data.frame")
##D 
##D ## dudi functions attempt to convert their first argument
##D ## to a data.frame; so they can be used on genind/genpop objects.
##D ## perform a PCA
##D pca1 <- dudi.pca(x, scale=FALSE, scannf=FALSE)
##D pca1
##D 
##D x <- genind2genpop(microbov,miss="chi2")
##D x <- as(x,"ktab")
##D class(x)
##D ## perform a STATIS analysis
##D statis1 <- statis(x, scannf=FALSE)
##D statis1
##D plot(statis1)
##D 
## End(Not run)



