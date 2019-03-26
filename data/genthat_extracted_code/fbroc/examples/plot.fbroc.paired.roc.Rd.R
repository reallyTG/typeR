library(fbroc)


### Name: plot.fbroc.paired.roc
### Title: Plots a 'fbroc.paired.roc' object
### Aliases: plot.fbroc.paired.roc

### ** Examples

data(roc.examples)
example <- boot.paired.roc(roc.examples$Cont.Pred, roc.examples$Cont.Pred.Outlier,
                           roc.examples$True.Class, n.boot = 100)
plot(example) # standard plot, no metric shown
plot(example, show.metric = "auc") # Include information about the AUC
plot(example, show.metric = "auc", show.conf = FALSE) # Show area instead
# Highlight TPR at an FPR of 20% 
plot(example, show.metric = "tpr", fpr = 0.2)    
plot(example, show.metric = "partial.auc", fpr = c(0.2, 0.4), 
     show.conf = FALSE, show.partial.auc.warning = FALSE) # Show area                  



