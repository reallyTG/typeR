library(DMwR)


### Name: experimentalComparison
### Title: Carry out Experimental Comparisons Among Learning Systems
### Aliases: experimentalComparison
### Keywords: models

### ** Examples

## Estimating several evaluation metrics on different variants of a
## regression tree and of a SVM, on  two data sets, using one repetition
## of 10-fold CV
data(swiss)
data(mtcars)

## First the user defined functions 
cv.rpartXse <- function(form, train, test, ...) {
    require(DMwR)
    t <- rpartXse(form, train, ...)
    p <- predict(t, test)
    mse <- mean((p - resp(form, test))^2)
    c(nmse = mse/mean((mean(resp(form, train)) - resp(form, test))^2), 
        mse = mse)
}

results <- experimentalComparison(
               c(dataset(Infant.Mortality ~ ., swiss),
                 dataset(mpg ~ ., mtcars)),
               c(variants('cv.rpartXse',se=c(0,0.5,1))),
               cvSettings(1,10,1234)
                                 )
## Check a summary of the results
summary(results)

bestScores(results)

## Check the statistical significance against the best model in terms of
## nmse for the swiss data set
compAnalysis(results,against='cv.rpartXse.v3',stats='nmse',datasets='swiss')

## Plot them
## Not run: 
##D plot(results)
## End(Not run)




