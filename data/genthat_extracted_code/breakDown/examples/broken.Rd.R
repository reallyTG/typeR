library(breakDown)


### Name: broken
### Title: Generic Function for Breaking Down of Model Predictions
### Aliases: broken

### ** Examples

## Not run: 
##D library("breakDown")
##D library("randomForest")
##D library("ggplot2")
##D set.seed(1313)
##D model <- randomForest(factor(left)~., data = HR_data, family = "binomial", maxnodes = 5)
##D predict.function <- function(model, new_observation)
##D       predict(model, new_observation, type="prob")[,2]
##D predict.function(model, HR_data[11,-7])
##D explain_1 <- broken(model, HR_data[11,-7], data = HR_data[,-7],
##D predict.function = predict.function, direction = "down")
##D explain_1
##D plot(explain_1) + ggtitle("breakDown plot (direction=down) for randomForest model")
##D 
##D explain_2 <- broken(model, HR_data[11,-7], data = HR_data[,-7],
##D predict.function = predict.function, direction = "down", keep_distributions = TRUE)
##D plot(explain_2, plot_distributions = TRUE) +
##D          ggtitle("breakDown distributions (direction=down) for randomForest model")
##D 
##D explain_3 <- broken(model, HR_data[11,-7], data = HR_data[,-7],
##D predict.function = predict.function, direction = "up", keep_distributions = TRUE)
##D plot(explain_3, plot_distributions = TRUE) +
##D          ggtitle("breakDown distributions (direction=up) for randomForest model")
## End(Not run)



