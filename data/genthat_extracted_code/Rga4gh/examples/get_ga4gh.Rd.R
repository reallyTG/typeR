library(Rga4gh)


### Name: get_ga4gh
### Title: GET an Object
### Aliases: get_ga4gh get_ga4gh.default get_ga4gh.ga4ghClient
###   get_ga4gh.list

### ** Examples


ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")

## Not run: 
##D 
##D ## Use the client and get an object from the api
##D ref_client %>% get_ga4gh("datasets", "id")
##D 
##D ## Or provide the API location as a string
##D get_ga4gh("http://1kgenomes.ga4gh.org", "datasets", "id")
## End(Not run)




