library(rgbif)


### Name: name_suggest
### Title: A quick and simple autocomplete service that returns up to 20
###   name usages by doing prefix matching against the scientific name.
###   Results are ordered by relevance.
### Aliases: name_suggest

### ** Examples

## Not run: 
##D name_suggest(q='Puma concolor')
##D name_suggest(q='Puma')
##D name_suggest(q='Puma', rank="genus")
##D name_suggest(q='Puma', rank="subspecies")
##D name_suggest(q='Puma', rank="species")
##D name_suggest(q='Puma', rank="infraspecific_name")
##D 
##D name_suggest(q='Puma', limit=2)
##D name_suggest(q='Puma', fields=c('key','canonicalName'))
##D name_suggest(q='Puma', fields=c('key','canonicalName',
##D   'higherClassificationMap'))
##D 
##D # Some parameters accept many inputs, treated as OR
##D name_suggest(rank = c("family", "genus"))
##D name_suggest(datasetKey = c("73605f3a-af85-4ade-bbc5-522bfb90d847",
##D   "d7c60346-44b6-400d-ba27-8d3fbeffc8a5"))
##D 
##D # Pass on curl options
##D name_suggest(q='Puma', limit=200, curlopts = list(verbose=TRUE))
## End(Not run)



