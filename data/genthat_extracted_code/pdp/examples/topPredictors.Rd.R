library(pdp)


### Name: topPredictors
### Title: Extract Most "Important" Predictors (Experimental)
### Aliases: topPredictors topPredictors.default topPredictors.train

### ** Examples

## Not run: 
##D #
##D # Regression example (requires randomForest package to run)
##D #
##D 
##D Load required packages
##D library(ggplot2)
##D library(randomForest)
##D 
##D # Fit a random forest to the mtcars dataset
##D data(mtcars, package = "datasets")
##D set.seed(101)
##D mtcars.rf <- randomForest(mpg ~ ., data = mtcars, mtry = 5, importance = TRUE)
##D 
##D # Topfour predictors
##D top4 <- topPredictors(mtcars.rf, n = 4)
##D 
##D # Construct partial dependence functions for top four predictors
##D pd <- NULL
##D for (i in top4) {
##D   tmp <- partial(mtcars.rf, pred.var = i)
##D   names(tmp) <- c("x", "y")
##D   pd <- rbind(pd,  cbind(tmp, predictor = i))
##D }
##D 
##D # Display partial dependence functions
##D ggplot(pd, aes(x, y)) +
##D   geom_line() +
##D   facet_wrap(~ predictor, scales = "free") +
##D   theme_bw() +
##D   ylab("mpg")
##D 
## End(Not run)



