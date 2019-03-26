library(poppr)


### Name: locus_table
### Title: Create a table of summary statistics per locus.
### Aliases: locus_table

### ** Examples


data(nancycats)
locus_table(nancycats[pop = 5])
## Not run: 
##D # Analyze locus statistics for the North American population of P. infestans.
##D # Note that due to the unknown dosage of alleles, many of these statistics
##D # will be artificially inflated for polyploids.
##D data(Pinf)
##D locus_table(Pinf, population = "North America")
## End(Not run)



