library(adegenet)


### Name: SNPbin-class
### Title: Formal class "SNPbin"
### Aliases: SNPbin SNPbin-class [,SNPbin-method [,SNPbin,ANY,ANY-method
###   [,SNPbin,ANY,ANY,ANY-method initialize,SNPbin-method
###   show,SNPbin-method nLoc,SNPbin-method $,SNPbin-method
###   $<-,SNPbin-method names,SNPbin-method ploidy,SNPbin-method
###   ploidy<-,SNPbin-method coerce,SNPbin,integer-method as.integer.SNPbin
###   NA.posi,SNPbin-method cbind.SNPbin c.SNPbin as,integer,SNPbin-method
###   as,numeric,SNPbin-method
### Keywords: classes

### ** Examples

## Not run: 
##D #### HAPLOID EXAMPLE ####
##D ## create a genotype of 100,000 SNPs
##D dat <- sample(c(0,1,NA), 1e5, prob=c(.495, .495, .01), replace=TRUE)
##D dat[1:10]
##D x <- new("SNPbin", dat)
##D x
##D x[1:10] # subsetting
##D as.integer(x[1:10])
##D 
##D ## try a few accessors
##D ploidy(x)
##D nLoc(x)
##D head(x$snp[[1]]) # internal bit-level coding
##D 
##D ## check that conversion is OK
##D identical(as(x, "integer"),as.integer(dat)) # SHOULD BE TRUE
##D 
##D ## compare the size of the objects
##D print(object.size(dat), unit="auto")
##D print(object.size(x), unit="auto")
##D object.size(dat)/object.size(x) # EFFICIENCY OF CONVERSION
##D 
##D 
##D #### TETRAPLOID EXAMPLE ####
##D ## create a genotype of 100,000 SNPs
##D dat <- sample(c(0:4,NA), 1e5, prob=c(rep(.995/5,5), 0.005), replace=TRUE)
##D x <- new("SNPbin", dat)
##D identical(as(x, "integer"),as.integer(dat)) # MUST BE TRUE
##D 
##D ## compare the size of the objects
##D print(object.size(dat), unit="auto")
##D print(object.size(x), unit="auto")
##D object.size(dat)/object.size(x) # EFFICIENCY OF CONVERSION
##D 
##D 
##D #### c, cbind ####
##D a <- new("SNPbin", c(1,1,1,1,1))
##D b <- new("SNPbin", c(0,0,0,0,0))
##D a
##D b
##D ab <- c(a,b)
##D ab
##D identical(c(a,b),cbind(a,b))
##D as.integer(ab)
## End(Not run)



