library(ggRandomForests)


### Name: calc_auc
### Title: Area Under the ROC Curve calculator
### Aliases: calc_auc calc_auc.gg_roc

### ** Examples

##
## Taken from the gg_roc example
rfsrc_iris <- rfsrc(Species ~ ., data = iris)
#data(rfsrc_iris)

## Not run: 
##D gg_dta <- gg_roc(rfsrc_iris, which.outcome=1)
##D 
##D calc_auc(gg_dta)
## End(Not run)

gg_dta <- gg_roc(rfsrc_iris, which.outcome=2)

calc_auc(gg_dta)




