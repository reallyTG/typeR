library(stm)


### Name: alignCorpus
### Title: Align the vocabulary of a new corpus to an old corpus
### Aliases: alignCorpus

### ** Examples

#we process an original set that is just the first 100 documents
temp<-textProcessor(documents=gadarian$open.ended.response[1:100],metadata=gadarian[1:100,])
out <- prepDocuments(temp$documents, temp$vocab, temp$meta)
set.seed(02138)
#Maximum EM its is set low to make this run fast, run models to convergence!
mod.out <- stm(out$documents, out$vocab, 3, prevalence=~treatment + s(pid_rep), 
              data=out$meta, max.em.its=5)
#now we process the remaining documents
temp<-textProcessor(documents=gadarian$open.ended.response[101:nrow(gadarian)],
                    metadata=gadarian[101:nrow(gadarian),])
#note we don't run prepCorpus here because we don't want to drop any words- we want 
#every word that showed up in the old documents.
newdocs <- alignCorpus(new=temp, old.vocab=mod.out$vocab)
#we get some helpful feedback on what has been retained and lost in the print out.
#and now we can fit our new held-out documents
fitNewDocuments(model=mod.out, documents=newdocs$documents, newData=newdocs$meta,
                origData=out$meta, prevalence=~treatment + s(pid_rep),
                prevalencePrior="Covariate")



