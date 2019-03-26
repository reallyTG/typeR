library(stm)


### Name: searchK
### Title: Computes diagnostic values for models with different values of K
###   (number of topics).
### Aliases: searchK

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
##D plot(kresult)
##D 
## End(Not run)
 



