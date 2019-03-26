library(phenology)


### Name: TableECFOCF
### Title: Format a CMR dataset into a file that fitCF can use.
### Aliases: TableECFOCF

### ** Examples

## Not run: 
##D library(phenology)
##D # Example
##D data(MarineTurtles_2002)
##D ECFOCF_2002 <- TableECFOCF(MarineTurtles_2002)
##D plot(ECFOCF_2002)
##D ECFOCF_2002 <- TableECFOCF(MarineTurtles_2002, date0=as.Date("2002-01-01"))
##D plot(ECFOCF_2002, period=11)
## End(Not run)



