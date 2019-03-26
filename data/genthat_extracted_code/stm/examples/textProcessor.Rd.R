library(stm)


### Name: textProcessor
### Title: Process a vector of raw texts
### Aliases: textProcessor print.textProcessor head.textProcessor
###   summary.textProcessor

### ** Examples


## Not run: 
##D 
##D head(gadarian)
##D #Process the data for analysis.
##D temp<-textProcessor(documents=gadarian$open.ended.response,metadata=gadarian)
##D meta<-temp$meta
##D vocab<-temp$vocab
##D docs<-temp$documents
##D out <- prepDocuments(docs, vocab, meta)
##D docs<-out$documents
##D vocab<-out$vocab
##D meta <-out$meta
## End(Not run)



