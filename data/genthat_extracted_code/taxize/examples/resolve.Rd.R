library(taxize)


### Name: resolve
### Title: Resolve names from different data sources
### Aliases: resolve

### ** Examples

## Not run: 
##D resolve(query=c("Helianthus annuus", "Homo sapiens"))
##D resolve(query="Quercus keloggii", db='gnr')
##D resolve(query=c("Helianthus annuus", "Homo sapiens"), db='tnrs')
##D resolve(query=c("Helianthus annuus", "Homo sapiens"), db=c('iplant', 'gnr'))
##D resolve(query="Quercus keloggii", db=c('iplant', 'gnr'))
##D resolve(query="Quercus keloggii", db=c('iplant', 'gnr', 'tnrs'))
##D 
##D # pass in options specific to each source
##D resolve("Helianthus annuus", db = 'gnr', preferred_data_sources = c(3, 4))
##D resolve("Helianthus annuus", db = 'iplant', retrieve = 'best')
##D identical(
##D  resolve("Helianthus annuus", db = 'iplant', retrieve = 'best')$iplant,
##D  iplant_resolve("Helianthus annuus", retrieve = 'best')
##D )
##D mynames <- c("Helianthus annuus", "Pinus contorta", "Poa annua",
##D    "Abies magnifica", "Rosa california")
##D resolve(mynames, db = 'tnrs', source = "NCBI")
##D resolve(mynames, db = 'tnrs', source = "iPlant_TNRS")
##D identical(
##D  resolve(mynames, db = 'tnrs', source = "iPlant_TNRS")$tnrs,
##D  tnrs(mynames, source = "iPlant_TNRS")
##D )
##D 
##D # pass in curl options
##D library("httr")
##D resolve(query="Qercuss", db = "iplant", config=verbose())
##D res <- resolve(query=c("Helianthus annuus", "Homo sapiens"), config=progress())
## End(Not run)



