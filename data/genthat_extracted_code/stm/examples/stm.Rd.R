library(stm)


### Name: stm
### Title: Variational EM for the Structural Topic Model
### Aliases: stm

### ** Examples


## Not run: 
##D 
##D #An example using the Gadarian data.  From Raw text to fitted model using 
##D #textProcessor() which leverages the tm Package
##D temp<-textProcessor(documents=gadarian$open.ended.response,metadata=gadarian)
##D out <- prepDocuments(temp$documents, temp$vocab, temp$meta)
##D set.seed(02138)
##D mod.out <- stm(out$documents, out$vocab, 3, 
##D                prevalence=~treatment + s(pid_rep), data=out$meta)
##D 
##D #The same example using quanteda instead of tm via textProcessor()
##D #Note this example works with quanteda version 0.9.9-31 and later
##D require(quanteda)
##D gadarian_corpus <- corpus(gadarian, text_field = "open.ended.response")
##D gadarian_dfm <- dfm(gadarian_corpus, 
##D                      remove = stopwords("english"),
##D                      stem = TRUE)
##D stm_from_dfm <- stm(gadarian_dfm, K = 3, prevalence = ~treatment + s(pid_rep),
##D                     data = docvars(gadarian_corpus))
##D                      
##D #An example of restarting a model
##D mod.out <- stm(out$documents, out$vocab, 3, prevalence=~treatment + s(pid_rep), 
##D                data=out$meta, max.em.its=5)
##D mod.out2 <- stm(out$documents, out$vocab, 3, prevalence=~treatment + s(pid_rep), 
##D                 data=out$meta, model=mod.out, max.em.its=10)
## End(Not run)



