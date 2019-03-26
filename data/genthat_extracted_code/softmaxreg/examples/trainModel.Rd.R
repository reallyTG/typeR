library(softmaxreg)


### Name: trainModel
### Title: Train softmax regression and classification model
### Aliases: trainModel
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D library(softmaxreg)
##D data(iris)
##D x = iris[,1:4]
##D y = iris$Species
##D sofmax_model = trainModel(x, y, hidden = c(5), funName = 'sigmoid', maxit = 3000,
##D     rang = 0.1, type = "class", algorithm = "adagrad", rate = 0.05, threshold = 1e-3)
##D summary(sofmax_model)
##D yFitMat = sofmax_model$fitted.values
##D yFit = c()
##D for (i in 1:length(y)) {
##D 	yFit = c(yFit, which(yFitMat[i,]==max(yFitMat[i,])))
##D }
##D table(y, yFit)
## End(Not run)



