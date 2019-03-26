library(stm)


### Name: selectModel
### Title: Assists the user in selecting the best STM model.
### Aliases: selectModel

### ** Examples


## Not run: 
##D 
##D temp<-textProcessor(documents=gadarian$open.ended.response, metadata=gadarian)
##D meta<-temp$meta
##D vocab<-temp$vocab
##D docs<-temp$documents
##D out <- prepDocuments(docs, vocab, meta)
##D docs<-out$documents
##D vocab<-out$vocab
##D meta <-out$meta
##D set.seed(02138)
##D mod.out <- selectModel(docs, vocab, K=3, prevalence=~treatment + s(pid_rep), 
##D                        data=meta, runs=5)
##D plotModels(mod.out)
##D selected<-mod.out$runout[[1]]
## End(Not run)



