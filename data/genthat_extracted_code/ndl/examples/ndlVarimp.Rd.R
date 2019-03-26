library(ndl)


### Name: ndlVarimp
### Title: Permutation variable importance for classification using naive
###   discriminative learning.
### Aliases: ndlVarimp
### Keywords: classif

### ** Examples

## Not run: 
##D data(dative)
##D dative <- dative[!is.na(dative$Speaker),-2]
##D dative.ndl <- ndlClassify(RealizationOfRecipient ~ ., data=dative)
##D dative.varimp <- ndlVarimp(dative.ndl)
##D 
##D library(lattice)
##D dotplot(sort(summary(dative.ndl)$statistics$accuracy-dative.varimp$accuracy), 
##D    xlab="permutation variable importance")
## End(Not run)



