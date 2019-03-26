library(taxize)


### Name: tax_rank
### Title: Get rank for a given taxonomic name.
### Aliases: tax_rank

### ** Examples

## Not run: 
##D tax_rank(x = "Helianthus annuus", db = "itis")
##D tax_rank(get_tsn("Helianthus annuus"))
##D tax_rank(c("Helianthus", "Pinus", "Poa"), db = "itis")
##D 
##D tax_rank(get_boldid("Helianthus annuus"))
##D tax_rank("421377", db = "bold")
##D tax_rank(421377, db = "bold")
##D 
##D tax_rank(c("Plantae", "Helianthus annuus",
##D   "Puma", "Homo sapiens"), db = 'itis')
##D tax_rank(c("Helianthus annuus", "Quercus", "Fabaceae"), db = 'tropicos')
##D 
##D tax_rank(names_list("species"), db = 'gbif')
##D tax_rank(names_list("family"), db = 'gbif')
##D 
##D tax_rank(c("Platanista gangetica", "Lichenopora neapolitana"),
##D   db = "worms")
## End(Not run)



