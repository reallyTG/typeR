library(WikidataQueryServiceR)


### Name: scrape_example
### Title: Scrape an example SPARQL query from Wikidata
### Aliases: scrape_example

### ** Examples

## Not run: 
##D sparql_query <- scrape_example(c("Cats", "Horses"))
##D query_wikidata(sparql_query)
##D # returns a named list with two data frames
##D # one called "Cats" and one called "Horses"
##D 
##D sparql_query <- scrape_example("Largest cities with female mayor")
##D cat(sparql_query)
##D query_wikidata(sparql_query)
## End(Not run)



