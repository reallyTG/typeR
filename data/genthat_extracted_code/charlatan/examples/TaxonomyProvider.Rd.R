library(charlatan)


### Name: TaxonomyProvider
### Title: TaxonomyProvider
### Aliases: TaxonomyProvider
### Keywords: internal

### ** Examples

(z <- TaxonomyProvider$new())
z$genus()
z$epithet()
z$species()
z$species(authority = TRUE)
## FIXME - datetimeprovider slow - may be related to unix time problem
# z$species(authority = TRUE, date = TRUE)



