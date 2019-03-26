library(JOUSBoost)


### Name: adaboost
### Title: AdaBoost Classifier
### Aliases: adaboost

### ** Examples

## Not run: 
##D # Generate data from the circle model
##D set.seed(111)
##D dat = circle_data(n = 500)
##D train_index = sample(1:500, 400)
##D 
##D ada = adaboost(dat$X[train_index,], dat$y[train_index], tree_depth = 2,
##D                n_rounds = 200, verbose = TRUE)
##D print(ada)
##D yhat_ada = predict(ada, dat$X[-train_index,])
##D 
##D # calculate misclassification rate
##D mean(dat$y[-train_index] != yhat_ada)
## End(Not run)



