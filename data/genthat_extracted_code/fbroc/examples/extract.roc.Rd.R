library(fbroc)


### Name: extract.roc
### Title: Extracts one from two paired ROC curves from a
###   'fbroc.paired.roc' object
### Aliases: extract.roc

### ** Examples

data(roc.examples)
example <- boot.paired.roc(roc.examples$Cont.Pred, roc.examples$Cont.Pred.Outlier, 
                           roc.examples$True.Class, n.boot = 100)
roc1 <- extract.roc(example, 1)
roc1.equivalent <- boot.roc(roc.examples$Cont.Pred, roc.examples$True.Class, 
                            n.boot = 100)
print(identical(roc1, roc1.equivalent)) # roc1 and roc1.equivalent will be the same
# This does not hold when use.cache = TRUE. See the note above.



