library(nlgeocoder)


### Name: nl_free
### Title: Free geocoding search
### Aliases: nl_free

### ** Examples

l <- nl_free("Henri Faasdreef 312")
l$response$numFound
l$response$docs["weergavenaam"]



