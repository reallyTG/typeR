library(dataone)


### Name: getQueryEngineDescription
### Title: Query a node for the list of query engines available on the node
### Aliases: getQueryEngineDescription
###   getQueryEngineDescription,D1Node-method

### ** Examples

library(dataone)
cn <- CNode("PROD")
engineDesc <- getQueryEngineDescription(cn, "solr")
cat(sprintf("Query engine version: %s\n", engineDesc$queryEngineVersion))
cat(sprintf("Query engine name: %s\n", engineDesc$name))
engineDesc <- getQueryEngineDescription(cn, "solr")
head(engineDesc$queryFields, n=3L)



