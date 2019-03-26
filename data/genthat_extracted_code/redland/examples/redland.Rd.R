library(redland)


### Name: redland
### Title: Create, query and write RDF graphs.
### Aliases: redland redland-package

### ** Examples

# This example creates the necessary R objects to hold an RDF model and reads 
# in a file that contains RDF/XML statements. This model is then queried for 
# and the query results inspected.
world <- new("World")
storage <- new("Storage", world, "hashes", name="", options="hash-type='memory'")
model <- new("Model", world, storage, options="")
filePath <- system.file("extdata/example.rdf", package="redland")
parser <- new("Parser", world)
parseFileIntoModel(parser, world, filePath, model)
queryString <- paste("PREFIX dc: <http://purl.org/dc/elements/1.1/> ",
                     "SELECT ?a ?c WHERE { ?a dc:description ?c . }", sep="")
query <- new("Query", world, queryString, base_uri=NULL, 
             query_language="sparql", query_uri=NULL)
# Get first (and only, in this case) result
queryResult <- executeQuery(query, model)
result <- getNextResult(queryResult)



