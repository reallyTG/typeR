library(tm)


### Name: meta
### Title: Metadata Management
### Aliases: DublinCore DublinCore<- meta meta.PCorpus meta.SimpleCorpus
###   meta.VCorpus meta<-.PCorpus meta<-.SimpleCorpus meta<-.VCorpus
###   meta.PlainTextDocument meta<-.PlainTextDocument meta.XMLTextDocument
###   meta<-.XMLTextDocument

### ** Examples

data("crude")
meta(crude[[1]])
DublinCore(crude[[1]])
meta(crude[[1]], tag = "topics")
meta(crude[[1]], tag = "comment") <- "A short comment."
meta(crude[[1]], tag = "topics") <- NULL
DublinCore(crude[[1]], tag = "creator") <- "Ano Nymous"
DublinCore(crude[[1]], tag = "format") <- "XML"
DublinCore(crude[[1]])
meta(crude[[1]])
meta(crude)
meta(crude, type = "corpus")
meta(crude, "labels") <- 21:40
meta(crude)



