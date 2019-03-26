library(auctestr)


### Name: se_auc
### Title: Compute standard error of AUC score, using its equivalence to
###   the Wilcoxon statistic.
### Aliases: se_auc

### ** Examples

se_auc(0.75, 20, 200)
## standard error decreases when data become more balanced over
## positive/negative outcome class, holding sample size fixed
se_auc(0.75, 110, 110)
## standard error increases when sample size shrinks
se_auc(0.75, 20, 20)



