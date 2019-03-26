library(textmining)


### Name: tmParsed
### Title: Function to create tmParsed
### Aliases: tmParsed

### ** Examples

corp <- tmCorpus(c("This is corp", "Document 2"))
parsed <- parse(corp)
parsed_ngram <- ngram(corp, k = 2)
parsed <- tmParsed(list(c("This", "is", "corp"), c("Document", "2")))
## Not run: 
##D corp <- tmCorpus("directory", package = "stylo")
##D parsed <- parse(corp)
##D parsed_ngram <- ngram(corp, k = 2)
##D parsed <- tmParsed(source = "directory", package = "stylo")
## End(Not run)




