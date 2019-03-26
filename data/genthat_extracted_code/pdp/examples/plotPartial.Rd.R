library(pdp)


### Name: plotPartial
### Title: Plotting Partial Dependence Functions
### Aliases: plotPartial plotPartial.ice plotPartial.cice
###   plotPartial.partial

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
##D   plotPartial(rug = TRUE, train = boston)
##D 
##D # Partial dependence of cmedv on lstat and rm
##D boston.rf %>%
##D   partial(pred.var = c("lstat", "rm"), chull = TRUE, progress = "text") %>%
##D   plotPartial(contour = TRUE, legend.title = "rm")
##D 
##D # ICE curves and c-ICE curves
##D age.ice <- partial(boston.rf, pred.var = "lstat", ice = TRUE)
##D p1 <- plotPartial(age.ice, alpha = 0.5)
##D p2 <- plotPartial(age.ice, center = TRUE, alpha = 0.5)
##D grid.arrange(p1, p2, ncol = 2)
## End(Not run)



