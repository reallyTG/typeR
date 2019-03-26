library(pdp)


### Name: autoplot.partial
### Title: Plotting Partial Dependence Functions
### Aliases: autoplot.partial autoplot.ice autoplot.cice

### ** Examples

## Not run: 
##D #
##D # Regression example (requires randomForest package to run)
##D #
##D 
##D # Load required packages
##D library(ggplot2)  # required to use autoplot
##D library(randomForest)
##D 
##D # Fit a random forest to the Boston housing data
##D data (boston)  # load the boston housing data
##D set.seed(101)  # for reproducibility
##D boston.rf <- randomForest(cmedv ~ ., data = boston)
##D 
##D # Partial dependence of cmedv on lstat
##D boston.rf %>%
##D   partial(pred.var = "lstat") %>%
##D   autoplot(rug = TRUE, train = boston)
##D 
##D # Partial dependence of cmedv on lstat and rm
##D boston.rf %>%
##D   partial(pred.var = c("lstat", "rm"), chull = TRUE, progress = "text") %>%
##D   autoplot(contour = TRUE, legend.title = "rm")
##D 
##D # ICE curves and c-ICE curves
##D age.ice <- partial(boston.rf, pred.var = "lstat", ice = TRUE)
##D grid.arrange(
##D   autoplot(age.ice, alpha = 0.5),                 # ICE curves
##D   autoplot(age.ice, center = TRUE, alpha = 0.5),  # c-ICE curves
##D   ncol = 2
##D )
## End(Not run)



