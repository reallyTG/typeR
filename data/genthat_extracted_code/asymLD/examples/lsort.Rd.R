library(asymLD)


### Name: lsort
### Title: Sort a data.frame.
### Aliases: lsort

### ** Examples

## Not run: 
##D library(asymLD)
##D data(snp.freqs)
##D 
##D # sort snp.freqs by "locus1" (ascending) and "allele1" (descending)
##D newdata <- lsort(snp.freqs, by=c("locus1","allele1"), asc=c(T,F))
##D head(newdata)
##D # sort snp.freqs by the fourth and the second variable (ascending)
##D newdata <- lsort(snp.freqs, by=c(4,2))
##D # sort "snp.freqs" by "locus1" and the 5th variable (ascending)
##D newdata <- lsort(snp.freqs, by=list("locus1",5))
##D 
## End(Not run)



