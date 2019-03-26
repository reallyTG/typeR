library(ggRandomForests)


### Name: calc_roc.rfsrc
### Title: Reciever Operator Characteristic calculator
### Aliases: calc_roc calc_roc.randomForest calc_roc.rfsrc

### ** Examples

## Taken from the gg_roc example
 rfsrc_iris <- rfsrc(Species ~ ., data = iris)
#data(rfsrc_iris)
gg_dta <- calc_roc.rfsrc(rfsrc_iris, rfsrc_iris$yvar, which.outcome=1, oob=TRUE)
gg_dta <- calc_roc.rfsrc(rfsrc_iris, rfsrc_iris$yvar, which.outcome=1, oob=FALSE)



