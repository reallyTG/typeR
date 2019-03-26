library(radiant.model)


### Name: auc
### Title: Area Under the Curve (AUC)
### Aliases: auc

### ** Examples

auc(runif(20000), dvd$buy, "yes")
auc(ifelse(dvd$buy == "yes", 1, 0), dvd$buy, "yes")




