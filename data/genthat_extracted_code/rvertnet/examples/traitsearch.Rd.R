library(rvertnet)


### Name: traitsearch
### Title: Trait focused search
### Aliases: traitsearch

### ** Examples

## Not run: 
##D traitsearch(has_mass = TRUE, limit = 3)
##D traitsearch(has_lifestage = TRUE)
##D traitsearch(has_mass = TRUE, has_length = TRUE)
##D res <- traitsearch(length_type = "total length",
##D   length = list(">= 300", "<= 1000"))
##D summary(as.numeric(res$data$lengthinmm))
##D res <- traitsearch(has_mass = TRUE, mass = list(">= 20", "<= 500"))
##D summary(as.numeric(res$data$massing))
##D 
##D traitsearch(taxon = "aves", has_mass = TRUE, limit = 100)
##D 
##D # curl options
##D traitsearch(has_mass = TRUE, limit = 10, callopts = list(verbose = TRUE))
## End(Not run)



