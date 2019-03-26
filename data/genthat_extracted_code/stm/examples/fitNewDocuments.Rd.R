library(stm)


### Name: fitNewDocuments
### Title: Fit New Documents
### Aliases: fitNewDocuments

### ** Examples

#An example using the Gadarian data.  From Raw text to fitted model.
#(for a case where documents are all not processed at once see the help
# file for alignCorpus)
temp<-textProcessor(documents=gadarian$open.ended.response,metadata=gadarian)
out <- prepDocuments(temp$documents, temp$vocab, temp$meta)
set.seed(02138)
#Maximum EM its is set low to make this run fast, run models to convergence!
mod.out <- stm(out$documents, out$vocab, 3, prevalence=~treatment + s(pid_rep), 
              data=out$meta, max.em.its=5)
fitNewDocuments(model=mod.out, documents=out$documents[1:5], newData=out$meta[1:5,],
               origData=out$meta, prevalence=~treatment + s(pid_rep),
               prevalencePrior="Covariate")



