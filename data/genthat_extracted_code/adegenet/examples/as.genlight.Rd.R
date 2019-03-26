library(adegenet)


### Name: as.genlight
### Title: Conversion to class "genlight"
### Aliases: as,genlight,matrix-method as,genlight,data.frame-method
###   as,genlight,list-method as.genlight as.genlight,matrix-method
###   as.genlight,data.frame-method as.genlight,list-method
###   coerce,genlight,matrix-method coerce,genlight,data.frame-method
###   coerce,genlight,list-method
### Keywords: classes

### ** Examples

## Not run: 
##D ## data to be converted
##D dat <- list(toto=c(1,1,0,0,2,2,1,2,NA), titi=c(NA,1,1,0,1,1,1,0,0), tata=c(NA,0,3, NA,1,1,1,0,0))
##D 
##D ## using the constructor
##D x1 <- new("genlight", dat)
##D x1
##D 
##D ## using 'as' methods
##D x2 <- as.genlight(dat)
##D x3 <- as(dat, "genlight")
##D 
##D identical(x1,x2)
##D identical(x1,x3)
## End(Not run)




