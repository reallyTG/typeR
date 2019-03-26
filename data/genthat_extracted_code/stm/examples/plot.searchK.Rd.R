library(stm)


### Name: plot.searchK
### Title: Plots diagnostic values resulting from searchK
### Aliases: plot.searchK

### ** Examples


## Not run: 
##D 
##D K<-c(5,10,15) 
##D temp<-textProcessor(documents=gadarian$open.ended.response,metadata=gadarian)
##D out <- prepDocuments(temp$documents, temp$vocab, temp$meta)
##D documents <- out$documents
##D vocab <- out$vocab
##D meta <- out$meta
##D set.seed(02138)
##D K<-c(5,10,15) 
##D kresult <- searchK(documents, vocab, K, prevalence=~treatment + s(pid_rep), data=meta)
##D 
##D plot(kresult)
## End(Not run)
 



