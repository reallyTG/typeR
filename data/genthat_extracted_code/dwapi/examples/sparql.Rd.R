library(dwapi)


### Name: sparql
### Title: Execute SPARQL query against a dataset.
### Aliases: sparql

### ** Examples

## Not run: 
##D  dwapi::sparql(dataset="user/dataset",
##D    query="SELECT *
##D           WHERE {
##D             ?s ?p ?o .
##D           } LIMIT 10")
##D 
##D dwapi::sparql(dataset="user/dataset",
##D   query="SELECT *
##D          WHERE {
##D          [ :Year ?year ; :Region ?region ; :Indicator_Coverage_and_Disaggregation ?score ]
##D          FILTER(?score > $v1)
##D          } LIMIT 10",
##D   queryParameters = list("$v1"=5.5))
## End(Not run)



