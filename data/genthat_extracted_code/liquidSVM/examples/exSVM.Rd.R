library(liquidSVM)


### Name: exSVM
### Title: Expectile Regression
### Aliases: exSVM svmExpectileRegression

### ** Examples

## Not run: 
##D tt <- ttsplit(quakes)
##D model <- exSVM(mag~., tt$train, display=1)
##D result <- test(model, tt$test)
##D 
##D errors(result)[2] ## is the same as
##D mean(ifelse(result[,2]<tt$test$mag, .1,.9) * (result[,2]-tt$test$mag)^2)
## End(Not run)



