library(boostr)


### Name: buildEstimationProcedure
### Title: Build a boostr compatible estimation procedure.
### Aliases: buildEstimationProcedure

### ** Examples

## Not run: 
##D  # examples of estimation procedures
##D  library(class)
##D  library(e1071)
##D 
##D   kNN <- function(data, formula, k) {
##D    df <- model.frame(formula=formula, data=data)
##D    function(newdata) {
##D      knn(train=df[, -1], test=newdata, cl=df[, 1], k=k)
##D    }
##D   }
##D 
##D   SVM <- function(data, formula, cost) {
##D    model <- svm(formula, data, cost=cost)
##D    function(newdata) {
##D      predict(model, newdata)
##D    }
##D   }
## End(Not run)



