library(stm)


### Name: checkResiduals
### Title: Residual dispersion test for topic number
### Aliases: checkResiduals

### ** Examples


#An example using the Gadarian data.  From Raw text to fitted model.
temp<-textProcessor(documents=gadarian$open.ended.response,metadata=gadarian)
meta<-temp$meta
vocab<-temp$vocab
docs<-temp$documents
out <- prepDocuments(docs, vocab, meta)
docs<-out$documents
vocab<-out$vocab
meta <-out$meta
set.seed(02138)
#maximum EM iterations set very low so example will run quickly.  
#Run your models to convergence!
mod.out <- stm(docs, vocab, 3, prevalence=~treatment + s(pid_rep), data=meta,
               max.em.its=5)
checkResiduals(mod.out, docs)



