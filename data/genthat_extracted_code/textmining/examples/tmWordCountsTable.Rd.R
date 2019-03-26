library(textmining)


### Name: tmWordCountsTable
### Title: Function to create tmWordCountsTable
### Aliases: tmWordCountsTable

### ** Examples

corp <- tmCorpus(c("This is corp", "Document two is this"))
parsed <- parse(corp)
parsed_ngram <- ngram(corp, k = 2)
tabled <- make_tabled(parsed)
tabled_ngram <- make_tabled(parsed_ngram)
## Not run: 
##D corp <- tmCorpus("directory", package = "stylo")
##D parsed <- parse(corp)
##D parsed_ngram <- ngram(corp, k = 2)
##D parsed <- tmParsed(source = "directory", package = "stylo")
## End(Not run)




