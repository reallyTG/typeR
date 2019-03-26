library(enrichvs)


### Name: auc
### Title: Function to calculate the Area Under the ROC Curve (AUC)
### Aliases: auc

### ** Examples

x <- rnorm(1000)  # random scores for 1000 compounds
y <- c(rep(1,50), rep(0,950))     # activity labels for "x"
auc(x, y)

data(dud_egfr)
auc(dud_egfr$energy, dud_egfr$label, decreasing=FALSE)

# AUC up to the first 10% of the false positives (ROC10%)
auc(dud_egfr$energy, dud_egfr$label, decreasing=FALSE, top=0.1)




