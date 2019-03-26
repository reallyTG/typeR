library(stm)


### Name: plot.estimateEffect
### Title: Plot effect of covariates on topics
### Aliases: plot.estimateEffect

### ** Examples


## Not run: 
##D 
##D prep <- estimateEffect(1:3 ~ treatment, gadarianFit, gadarian)
##D plot(prep, "treatment", model=gadarianFit,
##D method="pointestimate")
##D plot(prep, "treatment", model=gadarianFit,
##D method="difference",cov.value1=1,cov.value2=0)
##D 
##D #If the covariate were a binary factor, 
##D #the factor labels can be used to  
##D #specify the values of cov.value1 (e.g., cov.value1="treat"). 
##D 
##D # String variables must be turned to factors prior to plotting. 
##D #If you see this error, Error in rep.int(c(1, numeric(n)), n - 1L) : 
##D # invalid 'times' value, then you likely have not done this.
##D 
##D #Example of binary times binary interaction
##D gadarian$binaryvar <- sample(c(0,1), nrow(gadarian), replace=T)
##D temp <- textProcessor(gadarian$open.ended.response,metadata=gadarian)
##D out <- prepDocuments(temp$documents, temp$vocab, temp$meta)
##D stm1 <- stm(out$documents, out$vocab, 3, prevalence=~treatment*binaryvar,
##D  data=gadarian)
##D prep <- estimateEffect(c(2) ~ treatment*binaryvar, stmobj=stm1,
##D metadata=gadarian)
##D 
##D par(mfrow=c(1,2))
##D plot(prep, "treatment", method="pointestimate",
##D cov.value1=1, cov.value2=0, xlim=c(-1,1), moderator="binaryvar", moderator.value=1)
##D plot(prep, "treatment", method="pointestimate",
##D cov.value1=1, cov.value2=0, xlim=c(-1,1), moderator="binaryvar",
##D moderator.value=0)
## End(Not run)



