library(stm)


### Name: plot.MultimodDiagnostic
### Title: Plotting Method for Multimodality Diagnostic Objects
### Aliases: plot.MultimodDiagnostic
### Keywords: multimodality stm

### ** Examples



## Not run: 
##D 
##D # Example using Gadarian data
##D 
##D temp<-textProcessor(documents=gadarian$open.ended.response, 
##D                     metadata=gadarian)
##D meta<-temp$meta
##D vocab<-temp$vocab
##D docs<-temp$documents
##D out <- prepDocuments(docs, vocab, meta)
##D docs<-out$documents
##D vocab<-out$vocab
##D meta <-out$meta
##D set.seed(02138)
##D mod.out <- selectModel(docs, vocab, K=3, 
##D                        prevalence=~treatment + s(pid_rep), 
##D                        data=meta, runs=20)
##D 
##D out <- multiSTM(mod.out, mass.threshold = .75, 
##D                 reg.formula = ~ treatment,
##D                 metadata = gadarian)
##D 
##D plot(out)
##D plot(out, 1)
##D 
##D # One more example using Poliblog data
##D 
##D load(url("http://goo.gl/91KbfS"))
##D meta <- poliblogPrevFit$settings$covariates$X
##D out <- multiSTM(poliblogSelect, mass.threshold=.75, 
##D                 reg.formula= ~ ratingLiberal,
##D                 metadata=meta)
##D 
##D plot(out, ind=(1:4), topics=1)
##D plot(out, 16)
## End(Not run)



