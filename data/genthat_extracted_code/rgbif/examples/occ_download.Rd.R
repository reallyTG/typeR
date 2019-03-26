library(rgbif)


### Name: occ_download
### Title: Spin up a download request for GBIF occurrence data.
### Aliases: occ_download occ_download_prep

### ** Examples

## Not run: 
##D # occ_download("basisOfRecord = LITERATURE")
##D # occ_download('taxonKey = 3119195')
##D # occ_download('decimalLatitude > 50')
##D # occ_download('elevation >= 9000')
##D # occ_download('decimalLatitude >= 65')
##D # occ_download("country = US")
##D # occ_download("institutionCode = TLMF")
##D # occ_download("catalogNumber = Bird.27847588")
##D 
##D # res <- occ_download('taxonKey = 7264332', 'hasCoordinate = TRUE')
##D 
##D # pass output directly, or later, to occ_download_meta for more information
##D # occ_download('decimalLatitude > 75') %>% occ_download_meta
##D 
##D # Multiple queries
##D # occ_download('decimalLatitude >= 65', 'decimalLatitude <= -65', type="or")
##D # gg <- occ_download('depth = 80', 'taxonKey = 2343454', type="or")
##D 
##D # complex example with many predicates
##D # shows example of how to do date ranges for both year and month
##D # res <- occ_download(
##D #  "taxonKey = 2480946,5229208",
##D #  "basisOfRecord = HUMAN_OBSERVATION,OBSERVATION,MACHINE_OBSERVATION",
##D #  "country = US",
##D #  "hasCoordinate = true",
##D #  "hasGeospatialIssue = false",
##D #  "year >= 1999",
##D #  "year <= 2011",
##D #  "month >= 3",
##D #  "month <= 8"
##D # )
##D 
##D # Using body parameter - pass in your own complete query
##D ## as JSON
##D query1 <- '{"creator":"sckott",
##D   "notification_address":["myrmecocystus@gmail.com"],
##D   "predicate":{"type":"and","predicates":[
##D     {"type":"equals","key":"TAXON_KEY","value":"7264332"},
##D     {"type":"equals","key":"HAS_COORDINATE","value":"TRUE"}]}
##D  }'
##D # res <- occ_download(body = query1, curlopts=list(verbose=TRUE))
##D 
##D ## as a list
##D library(jsonlite)
##D query <- list(
##D   creator = unbox("sckott"),
##D   notification_address = "myrmecocystus@gmail.com",
##D   predicate = list(
##D     type = unbox("and"),
##D     predicates = list(
##D       list(type = unbox("equals"), key = unbox("TAXON_KEY"),
##D         value = unbox("7264332")),
##D       list(type = unbox("equals"), key = unbox("HAS_COORDINATE"),
##D         value = unbox("TRUE"))
##D     )
##D   )
##D )
##D # res <- occ_download(body = query, curlopts = list(verbose = TRUE))
##D 
##D # Prepared query
##D occ_download_prep("basisOfRecord = LITERATURE")
## End(Not run)



