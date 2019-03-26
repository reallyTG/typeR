library(pegas)


### Name: as.loci
### Title: Conversion Among Allelic Data Classes
### Aliases: as.loci as.loci.genind as.loci.data.frame as.loci.factor
###   as.loci.character genind2loci loci2genind
### Keywords: IO

### ** Examples

x <- c("A-A", "A-a", "a-a")
as.loci(x, allele.sep = "-")
## Not run: 
##D require(adegenet)
##D data(nancycats)
##D x <- as.loci(nancycats)
##D y <- loci2genind(x) # back to "genind"
##D identical(nancycats@tab, y@tab)
##D identical(nancycats@pop, y@pop)
## End(Not run)


