library(adegenet)


### Name: as.SNPbin
### Title: Conversion to class "SNPbin"
### Aliases: as,SNPbin,integer-method as,SNPbin,numeric-method as.SNPbin
###   as.SNPbin,integer-method as.SNPbin,numeric-method
###   coerce,integer,SNPbin-method coerce,numeric,SNPbin-method
### Keywords: classes

### ** Examples

## Not run: 
##D ## data to be converted
##D dat <- c(1,0,0,2,1,1,1,2,2,1,1,0,0,1)
##D 
##D ## using the constructor
##D x1 <- new("SNPbin", dat)
##D x1
##D 
##D ## using 'as' methods
##D x2 <- as.SNPbin(dat)
##D x3 <- as(dat, "SNPbin")
##D 
##D identical(x1,x2)
##D identical(x1,x3)
## End(Not run)



