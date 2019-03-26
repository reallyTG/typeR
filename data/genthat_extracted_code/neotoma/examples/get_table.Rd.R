library(neotoma)


### Name: get_table
### Title: Get Neotoma value tables.
### Aliases: get_table
### Keywords: IO connection

### ** Examples

## Not run: 
##D taxon.table <- get_table('Taxa')
##D 
##D #  Get the frequency of a random taxon in Neotoma.
##D tax_sample <- sample(nrow(taxon.table), 1)
##D cat("The taxon", 
##D     taxon.table$TaxonName[tax_sample], 
##D     "occurs in Neotoma", 
##D     length(get_dataset(taxonname = taxon.table$TaxonName[tax_sample])), 
##D     "times.")
## End(Not run)



