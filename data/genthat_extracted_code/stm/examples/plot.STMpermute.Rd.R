library(stm)


### Name: plot.STMpermute
### Title: Plot an STM permutation test.
### Aliases: plot.STMpermute

### ** Examples


## Not run: 
##D 
##D temp<-textProcessor(documents=gadarian$open.ended.response,metadata=gadarian)
##D out <- prepDocuments(temp$documents, temp$vocab, temp$meta)
##D documents <- out$documents
##D vocab <- out$vocab
##D meta <- out$meta
##D set.seed(02138)
##D mod.out <- stm(documents, vocab, 3, prevalence=~treatment + s(pid_rep), data=meta)
##D summary(mod.out)
##D prep <- estimateEffect(1:3 ~ treatment + s(pid_rep), mod.out, meta)
##D plot(prep, "treatment", model=mod.out,
##D      method="difference",cov.value1=1,cov.value2=0)
##D test <- permutationTest(formula=~ treatment + s(pid_rep), stmobj=mod.out, 
##D                         treatment="treatment", nruns=25, documents=documents,
##D                         vocab=vocab,data=meta, stmverbose=FALSE)
##D plot(test,2, xlab="Effect", ylab="Model Index", main="Topic 2 Placebo Test")
## End(Not run)



