library(mclust)


### Name: predict.MclustDA
### Title: Classify multivariate observations by Gaussian finite mixture
###   modeling
### Aliases: predict.MclustDA
### Keywords: multivariate

### ** Examples

## Not run: 
##D odd <- seq(from = 1, to = nrow(iris), by = 2)
##D even <- odd + 1
##D X.train <- iris[odd,-5]
##D Class.train <- iris[odd,5]
##D X.test <- iris[even,-5]
##D Class.test <- iris[even,5]
##D 
##D irisMclustDA <- MclustDA(X.train, Class.train)
##D 
##D predTrain <- predict(irisMclustDA)
##D predTrain
##D predTest <- predict(irisMclustDA, X.test)
##D predTest
## End(Not run)



