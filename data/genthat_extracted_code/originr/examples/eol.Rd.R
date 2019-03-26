library(originr)


### Name: eol
### Title: Search for presence of taxonomic names in EOL invasive species
###   databases.
### Aliases: eol eol_invasive_data

### ** Examples

## Not run: 
##D eol(name='Brassica oleracea', dataset='gisd')
##D eol(name=c('Lymantria dispar','Cygnus olor','Hydrilla verticillata',
##D   'Pinus concolor'), dataset='gisd')
##D eol(name='Sargassum', dataset='gisd')
##D eol(name='Ciona intestinalis', dataset='mineps')
##D eol(name=c('Lymantria dispar','Cygnus olor','Hydrilla verticillata',
##D   'Pinus concolor'), dataset='i3n')
##D eol(name=c('Branta canadensis','Gallus gallus','Myiopsitta monachus'),
##D    dataset='daisie')
##D eol(name=c('Branta canadensis','Gallus gallus','Myiopsitta monachus'),
##D   dataset='isc')
##D 
##D # Count
##D eol(name=c('Lymantria dispar','Cygnus olor','Hydrilla verticillata',
##D   'Pinus concolor'), dataset='gisd', count = TRUE)
##D 
##D # curl options
##D eol(name='Sargassum', dataset='gisd', verbose = TRUE)
## End(Not run)



