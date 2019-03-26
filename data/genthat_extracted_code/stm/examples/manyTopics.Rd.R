library(stm)


### Name: manyTopics
### Title: Performs model selection across separate STM's that each assume
###   different numbers of topics.
### Aliases: manyTopics

### ** Examples


## Not run: 
##D 
##D temp<-textProcessor(documents=gadarian$open.ended.response,metadata=gadarian)
##D meta<-temp$meta
##D vocab<-temp$vocab
##D docs<-temp$documents
##D out <- prepDocuments(docs, vocab, meta)
##D docs<-out$documents
##D vocab<-out$vocab
##D meta <-out$meta
##D 
##D set.seed(02138)
##D storage<-manyTopics(docs,vocab,K=3:4, prevalence=~treatment + s(pid_rep),data=meta, runs=10)
##D #This chooses the output, a single run of STM that was selected,
##D #from the runs of the 3 topic model
##D t<-storage$out[[1]]
##D #This chooses the output, a single run of STM that was selected,
##D #from the runs of the 4 topic model
##D t<-storage$out[[2]]
##D #Please note that the way to extract a result for manyTopics is different from selectModel.
## End(Not run)



