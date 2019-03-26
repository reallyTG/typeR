library(adegenet)


### Name: minorAllele
### Title: Compute minor allele frequency
### Aliases: minorAllele

### ** Examples

## Not run: 
##D 
##D ## LOAD DATA
##D data(nancycats)
##D 
##D ## COMPUTE ALLELE FREQUENCIES
##D x <- nancycats
##D apply(tab(x, freq=TRUE),2,mean, na.rm=TRUE)
##D 
##D ## GET MINOR ALLELE FREQUENCY
##D m.freq <- minorAllele(x)
##D m.freq
## End(Not run)




