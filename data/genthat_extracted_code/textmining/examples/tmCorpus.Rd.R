library(textmining)


### Name: tmCorpus
### Title: Function to create tmCorpus
### Aliases: tmCorpus

### ** Examples

corp <- tmCorpus(c("This is corp", "Document 2"))
corp <- tmCorpus(list("This is corp", "Document 2"))
corp <- tmCorpus(VectorSource(c("This is corp", "Document 2")), package = "tm")
## Not run: 
##D corp <- tmCorpus(DirSource("directory"), package = "tm")
##D corp <- tmCorpus("directory", package = "stylo")
## End(Not run)




