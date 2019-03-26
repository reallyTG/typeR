library(ggRandomForests)


### Name: gg_roc.rfsrc
### Title: ROC (Receiver operator curve) data from a classification random
###   forest.
### Aliases: gg_roc gg_roc.randomForest gg_roc.rfsrc

### ** Examples

## ------------------------------------------------------------
## classification example
## ------------------------------------------------------------
## -------- iris data
rfsrc_iris <- rfsrc(Species ~ ., data = iris)
#data(rfsrc_iris, package="ggRandomForests")

# ROC for setosa
gg_dta <- gg_roc(rfsrc_iris, which.outcome=1)
plot(gg_dta)

# ROC for versicolor
gg_dta <- gg_roc(rfsrc_iris, which.outcome=2)
plot(gg_dta)

# ROC for virginica
gg_dta <- gg_roc(rfsrc_iris, which.outcome=3)
plot(gg_dta)






