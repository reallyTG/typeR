library(JOUSBoost)


### Name: predict.adaboost
### Title: Create predictions from AdaBoost fit
### Aliases: predict.adaboost

### ** Examples

## Not run: 
##D # Generate data from the circle model
##D set.seed(111)
##D dat = circle_data(n = 500)
##D train_index = sample(1:500, 400)
##D 
##D ada = adaboost(dat$X[train_index,], dat$y[train_index], tree_depth = 2,
##D                n_rounds = 100, verbose = TRUE)
##D # get class prediction
##D yhat = predict(ada, dat$X[-train_index, ])
##D # get probability estimate
##D phat = predict(ada, dat$X[-train_index, ], type="prob")
## End(Not run)




