library(SPARQL)


### Name: SPARQL-package
### Title: SPARQL client
### Aliases: SPARQL-package
### Keywords: package

### ** Examples

## Not run: 
##D d <- SPARQL(url="http://services.data.gov.uk/reference/sparql",
##D             query="SELECT * WHERE { ?s ?p ?o . } LIMIT 10",
##D             ns=c('time','<http://www.w3.org/2006/time#>'))
##D 
##D is.data.frame(d$results)
##D 
##D # draw a pie chart from data from the Linked Open Piracy data set
##D endpoint <- "http://semanticweb.cs.vu.nl/lop/sparql/"
##D q <-
##D   "SELECT *
##D    WHERE {
##D      ?event sem:hasPlace ?place .
##D      ?place eez:inPiracyRegion ?region .
##D    } LIMIT 20"
##D prefix <- c("lop","http://semanticweb.cs.vu.nl/poseidon/ns/instances/",
##D             "eez","http://semanticweb.cs.vu.nl/poseidon/ns/eez/")
##D res <- SPARQL(endpoint,q,prefix)$results
##D pie(sort(table(res$region)),col=rainbow(12))
## End(Not run)



