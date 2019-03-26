library(liquidSVM)


### Name: lsSVM
### Title: Least Squares Regression
### Aliases: lsSVM svmRegression

### ** Examples

## Not run: 
##D tt <- ttsplit(quakes)
##D model <- lsSVM(mag~., tt$train, display=1)
##D result <- test(model, tt$test)
##D 
##D errors(result) ## is the same as
##D mean( (tt$test$mag-result)^2 )
## End(Not run)



