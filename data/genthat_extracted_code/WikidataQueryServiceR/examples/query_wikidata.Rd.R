library(WikidataQueryServiceR)


### Name: query_wikidata
### Title: Send one or more SPARQL queries to WDQS
### Aliases: query_wikidata

### ** Examples

# R's versions and release dates:
sparql_query <- 'SELECT DISTINCT
  ?softwareVersion ?publicationDate
WHERE {
  BIND(wd:Q206904 AS ?R)
  ?R p:P348 [
    ps:P348 ?softwareVersion;
    pq:P577 ?publicationDate
  ] .
}'
query_wikidata(sparql_query)

## Not run: 
##D # "smart" format converts all datetime columns to POSIXlt
##D query_wikidata(sparql_query, format = "smart")
## End(Not run)



