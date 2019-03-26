library(ndl)


### Name: ndlCrossvalidate
### Title: Crossvalidation of a Naive Discriminative Learning model.
### Aliases: ndlCrossvalidate
### Keywords: classif

### ** Examples

data(think)
set.seed(314)
think <- think[sample(1:nrow(think),500),]
think.cv5 <- ndlCrossvalidate(Lexeme ~ Agent + Patient, data=think, k=5)
summary(think.cv5)
rm(think)

## Not run: 
##D data(think)
##D think.cv10 <- ndlCrossvalidate(Lexeme ~ Person + Number + Agent + Patient + Register,
##D    data=think, k=10)
##D summary(think.cv10)
## End(Not run)
## Not run: 
##D library(languageR)
##D data(finalDevoicing)
##D finDev.cv10 <- ndlCrossvalidate(Voice ~ Onset1Type + Onset2Type + VowelType *
##D    ConsonantType * Obstruent + Nsyll + Stress, data=finalDevoicing, k=10)
##D summary(finDev.cv10)
##D 
## End(Not run)




