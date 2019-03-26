library(liquidSVM)


### Name: qtSVM
### Title: Quantile Regression
### Aliases: qtSVM svmQuantileRegression

### ** Examples

## Not run: 
##D tt <- ttsplit(quakes)
##D model <- qtSVM(mag~., tt$train, display=1)
##D result <- test(model, tt$test)
##D 
##D errors(result)[2] ## is the same as
##D mean(ifelse(result[,2]<tt$test$mag, -.1,.9) * (result[,2]-tt$test$mag))
## End(Not run)



