library(stm)


### Name: topicQuality
### Title: Plots semantic coherence and exclusivity for each topic.
### Aliases: topicQuality

### ** Examples


## Not run: 
##D 
##D   #Semantic Coherence calculations require the original documents so we need
##D   #to reconstruct them here.
##D   temp<-textProcessor(documents=gadarian$open.ended.response,metadata=gadarian)
##D   meta<-temp$meta
##D   vocab<-temp$vocab
##D   docs<-temp$documents
##D   out <- prepDocuments(docs, vocab, meta)
##D   docs<-out$documents
##D   vocab<-out$vocab
##D   meta <-out$meta
##D   topicQuality(model=gadarianFit, documents=docs)
## End(Not run)



