library(nlgeocoder)


### Name: nl_suggest
### Title: Get a list of suggestions for geolocations in NL
### Aliases: nl_suggest

### ** Examples

sug <- nl_suggest("Henri Faasdreef")

# how many objects have a score?
sug$response$numFound

# get suggestions
sug$response$docs



