library(solrium)


### Name: update_csv
### Title: Update documents with CSV data
### Aliases: update_csv

### ** Examples

## Not run: 
##D # start Solr: bin/solr start -f -c -p 8983
##D 
##D # connect
##D (cli <- SolrClient$new())
##D 
##D if (!cli$collection_exists("helloWorld")) {
##D   cli$collection_create(name = "helloWorld", numShards = 2)
##D }
##D 
##D df <- data.frame(id=1:3, name=c('red', 'blue', 'green'))
##D write.csv(df, file="df.csv", row.names=FALSE, quote = FALSE)
##D conn$update_csv("df.csv", "helloWorld", verbose = TRUE)
##D 
##D # give back raw xml
##D conn$update_csv("df.csv", "helloWorld", wt = "xml")
##D ## raw json
##D conn$update_csv("df.csv", "helloWorld", wt = "json", raw = TRUE)
## End(Not run)



