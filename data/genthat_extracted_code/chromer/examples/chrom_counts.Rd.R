library(chromer)


### Name: chrom_counts
### Title: Returns chromosome counts from Chromosome Counts Database API
### Aliases: chrom_counts

### ** Examples

## Not run: 
##D 
##D ## Get all counts for genus Castilleja
##D chrom_counts("Castilleja", "genus")
##D 
##D ## Get all counts for both Castilleja and Lachemilla
##D chrom_counts(c("Castilleja", "Lachemilla"), "genus")
##D 
##D ## Get all counts for Castilleja miniata
##D chrom_counts("Castilleja miniata", "species")
##D 
##D ## Get all counts for only Castilleja miniata subsp. elata
##D chrom_counts("Castilleja miniata subsp. elata", "species")
##D 
##D ## Note that searching for "Castilleja miniata" will return
##D ## all subspecies and varieties
##D 
##D ## Get all counts for the Orobanchaceae
##D chrom_counts("Orobanchaceae", "family")
##D 
## End(Not run)



