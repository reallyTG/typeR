library(rdflib)


### Name: rdf_query
### Title: Perform a SPARQL Query
### Aliases: rdf_query

### ** Examples

doc <- system.file("extdata", "dc.rdf", package="redland")

sparql <-
'PREFIX dc: <http://purl.org/dc/elements/1.1/>
 SELECT ?a ?c
 WHERE { ?a dc:creator ?c . }'

rdf <- rdf_parse(doc)
rdf_query(rdf, sparql)




