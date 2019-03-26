library(pdp)


### Name: partial
### Title: Partial Dependence Functions
### Aliases: partial partial.default

### ** Examples

## Not run: 
##D #
##D # Regression example (requires randomForest package to run)
##D #
##D 
##D # Fit a random forest to the boston housing data
##D library(randomForest)
##D data (boston)  # load the boston housing data
##D set.seed(101)  # for reproducibility
##D boston.rf <- randomForest(cmedv ~ ., data = boston)
##D 
##D # Using randomForest's partialPlot function
##D partialPlot(boston.rf, pred.data = boston, x.var = "lstat")
##D 
##D # Using pdp's partial function
##D head(partial(boston.rf, pred.var = "lstat"))  # returns a data frame
##D partial(boston.rf, pred.var = "lstat", plot = TRUE, rug = TRUE)
##D 
##D # The partial function allows for multiple predictors
##D partial(boston.rf, pred.var = c("lstat", "rm"), grid.resolution = 40,
##D         plot = TRUE, chull = TRUE, progress = "text")
##D 
##D # The plotPartial function offers more flexible plotting
##D pd <- partial(boston.rf, pred.var = c("lstat", "rm"), grid.resolution = 40)
##D plotPartial(pd, levelplot = FALSE, zlab = "cmedv", drape = TRUE,
##D             colorkey = FALSE, screen = list(z = -20, x = -60))
##D 
##D # The autplot function can be used to produce graphics based on ggplot2
##D library(ggplot2)
##D autoplot(pd, contour = TRUE, legend.title = "Partial\ndependence")
##D 
##D #
##D # Individual conditional expectation (ICE) curves
##D #
##D 
##D # Use partial to obtain ICE/c-ICE curves
##D rm.ice <- partial(boston.rf, pred.var = "rm", ice = TRUE)
##D plotPartial(rm.ice, rug = TRUE, train = boston, alpha = 0.2)
##D autoplot(rm.ice, center = TRUE, alpha = 0.2, rug = TRUE, train = boston)
##D 
##D #
##D # Classification example (requires randomForest package to run)
##D #
##D 
##D # Fit a random forest to the Pima Indians diabetes data
##D data (pima)  # load the boston housing data
##D set.seed(102)  # for reproducibility
##D pima.rf <- randomForest(diabetes ~ ., data = pima, na.action = na.omit)
##D 
##D # Partial dependence of positive test result on glucose (default logit scale)
##D partial(pima.rf, pred.var = "glucose", plot = TRUE, chull = TRUE,
##D         progress = "text")
##D 
##D # Partial dependence of positive test result on glucose (probability scale)
##D partial(pima.rf, pred.var = "glucose", prob = TRUE, plot = TRUE,
##D         chull = TRUE, progress = "text")
## End(Not run)



