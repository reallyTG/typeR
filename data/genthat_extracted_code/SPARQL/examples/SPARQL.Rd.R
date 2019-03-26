library(SPARQL)


### Name: SPARQL
### Title: SPARQL client
### Aliases: SPARQL
### Keywords: SPARQL

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
##D    }"
##D prefix <- c("lop","http://semanticweb.cs.vu.nl/poseidon/ns/instances/",
##D             "eez","http://semanticweb.cs.vu.nl/poseidon/ns/eez/")
##D res <- SPARQL(endpoint,q,prefix)$results
##D pie(sort(table(res$region)),col=rainbow(12))
##D 
##D # draw a stacked bar chart from data from the Linked Open Piracy data set
##D q <-
##D   "SELECT *
##D    WHERE {
##D      ?event sem:eventType ?event_type .
##D      ?event sem:hasPlace ?place .
##D      ?place eez:inPiracyRegion ?region .
##D    }"
##D res <- SPARQL(endpoint,q,ns=prefix)$results
##D restable <- table(res$event_type,res$region)
##D par(mar=c(4,10,1,1))
##D barplot(restable,col=rainbow(10),horiz=TRUE,las=1,cex.names=0.8)
##D legend("topright",rownames(restable),
##D        cex=0.8,bty="n",fill=rainbow(10))
## End(Not run)



