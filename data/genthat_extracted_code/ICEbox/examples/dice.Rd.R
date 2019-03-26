library(ICEbox)


### Name: dice
### Title: Creates an object of class 'dice'.
### Aliases: dice

### ** Examples

 ## Not run: 
##D # same examples as for 'ice', but now create a derivative estimate as well.
##D require(ICEbox)
##D require(randomForest)
##D require(MASS) #has Boston Housing data, Pima
##D 
##D ########  regression example
##D data(Boston) #Boston Housing data
##D X = Boston
##D y = X$medv
##D X$medv = NULL
##D 
##D ## build a RF:
##D bhd_rf_mod = randomForest(X, y)
##D 
##D ## Create an 'ice' object for the predictor "age":
##D bhd.ice = ice(object = bhd_rf_mod, X = X, y = y, predictor = "age", frac_to_build = .1)
##D 
##D # make a dice object:
##D bhd.dice = dice(bhd.ice)
##D 
##D #### classification example
##D data(Pima.te)  #Pima Indians diabetes classification
##D y = Pima.te$type
##D X = Pima.te
##D X$type = NULL
##D 
##D ## build a RF:
##D pima_rf = randomForest(x = X, y = y)
##D 
##D ## Create an 'ice' object for the predictor "skin":
##D # For classification we plot the centered log-odds. If we pass a predict
##D # function that returns fitted probabilities, setting logodds = TRUE instructs
##D # the function to set each ice curve to the centered log-odds of the fitted 
##D # probability. 
##D pima.ice = ice(object = pima_rf, X = X, predictor = "skin", logodds = TRUE,
##D                     predictfcn = function(object, newdata){ 
##D                          predict(object, newdata, type = "prob")[, 2]
##D                     }
##D               )
##D 
##D # make a dice object:
##D pima.dice = dice(pima.ice)
## End(Not run)




