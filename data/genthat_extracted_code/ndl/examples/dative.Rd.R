library(ndl)


### Name: dative
### Title: Dative Alternation
### Aliases: dative
### Keywords: datasets

### ** Examples

## Not run: 
##D data(dative)
##D out <- which(is.element(colnames(dative), c("Speaker","Verb")))
##D dative <- dative[,-out]
##D dative.ndl <- ndlClassify(RealizationOfRecipient ~ ., data=dative)
##D ndlStatistics(dative.ndl)
##D 
## End(Not run) 


