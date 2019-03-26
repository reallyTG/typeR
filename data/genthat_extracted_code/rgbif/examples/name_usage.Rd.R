library(rgbif)


### Name: name_usage
### Title: Lookup details for specific names in all taxonomies in GBIF.
### Aliases: name_usage

### ** Examples

## Not run: 
##D # A single name usage
##D name_usage(key=1)
##D 
##D # Name usage for a taxonomic name
##D name_usage(name='Puma', rank="GENUS")
##D 
##D # Name usage for all taxa in a dataset 
##D # (set sufficient high limit, but less than 100000)
##D # name_usage(datasetKey = "9ff7d317-609b-4c08-bd86-3bc404b77c42", limit = 10000)
##D # All name usages
##D name_usage()
##D 
##D # References for a name usage
##D name_usage(key=2435099, data='references')
##D 
##D # Species profiles, descriptions
##D name_usage(key=3119195, data='speciesProfiles')
##D name_usage(key=3119195, data='descriptions')
##D name_usage(key=2435099, data='children')
##D 
##D # Vernacular names for a name usage
##D name_usage(key=3119195, data='vernacularNames')
##D 
##D # Limit number of results returned
##D name_usage(key=3119195, data='vernacularNames', limit=3)
##D 
##D # Search for names by dataset with datasetKey parameter
##D name_usage(datasetKey="d7dddbf4-2cf0-4f39-9b2a-bb099caae36c")
##D 
##D # Search for a particular language
##D name_usage(key=3119195, language="FRENCH", data='vernacularNames')
##D 
##D # get root usage with a uuid
##D name_usage(data = "root", uuid = "73605f3a-af85-4ade-bbc5-522bfb90d847")
##D 
##D # search by language
##D name_usage(language = "spanish")
##D 
##D # Pass on curl options
##D name_usage(name='Puma concolor', limit=300, curlopts = list(verbose=TRUE))
## End(Not run)



