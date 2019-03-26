library(redland)


### Name: getResults
### Title: Return all query results
### Aliases: getResults getResults,Query-method

### ** Examples

world <- new("World")
storage <- new("Storage", world, "hashes", name="", options="hash-type='memory'")
model <- new("Model", world, storage, options="")
stmt <- new("Statement", world=world, 
  subject="https://orcid.org/0000-0002-2192-403X",
  predicate="http://www.w3.org/ns/prov#Agent",
  object="slaughter", 
  objectType="literal", datatype_uri="http://www.w3.org/2001/XMLSchema#string")
  #objectType="literal", language="en")
status <- addStatement(model, stmt)
queryString <- paste("PREFIX orcid: <https://orcid.org/>",
                     "PREFIX dataone: <https://cn.dataone.org/cn/v1/resolve/>",
                     "PREFIX prov: <http://www.w3.org/ns/prov#>",
                     "SELECT ?a ?c WHERE { ?a prov:Agent ?c . }", sep=" ")
query <- new("Query", world, queryString, base_uri=NULL, query_language="sparql", query_uri=NULL)
# Return all results as a string
results <- getResults(query, model, "rdfxml")
results <- getResults(query, model, "turtle")
results <- getResults(query, model, "json")

# When the query object is no longer needed, the resources it had allocated can be freed.
freeQuery(query)
rm(query)



