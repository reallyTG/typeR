library(ggRandomForests)


### Name: plot.gg_roc
### Title: ROC plot generic function for a 'gg_roc' object.
### Aliases: plot.gg_roc

### ** Examples

## Not run: 
##D ## ------------------------------------------------------------
##D ## classification example
##D ## ------------------------------------------------------------
##D ## -------- iris data
##D #rfsrc_iris <- rfsrc(Species ~ ., data = iris)
##D data(rfsrc_iris, package="ggRandomForests")
##D 
##D # ROC for setosa
##D gg_dta <- gg_roc(rfsrc_iris, which.outcome=1)
##D plot.gg_roc(gg_dta)
##D 
##D # ROC for versicolor
##D gg_dta <- gg_roc(rfsrc_iris, which.outcome=2)
##D plot.gg_roc(gg_dta)
##D 
##D # ROC for virginica
##D gg_dta <- gg_roc(rfsrc_iris, which.outcome=3)
##D plot.gg_roc(gg_dta)
##D 
##D # Alternatively, you can plot all three outcomes in one go
##D # by calling the plot function on the forest object. 
##D plot.gg_roc(rfsrc_iris)
##D 
## End(Not run)




