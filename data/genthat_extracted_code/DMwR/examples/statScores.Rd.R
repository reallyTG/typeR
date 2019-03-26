library(DMwR)


### Name: statScores
### Title: Obtains a summary statistic of one of the evaluation metrics
###   used in an experimental comparison, for all learners and data sets
###   involved in the comparison.
### Aliases: statScores
### Keywords: models

### ** Examples

## Estimating several evaluation metrics on different variants of a
## regression tree and of a SVM, on  two data sets, using one repetition
## of  10-fold CV
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

## run the experimental comparison
results <- experimentalComparison(
               c(dataset(Infant.Mortality ~ ., swiss),
                 dataset(mpg ~ ., mtcars)),
               c(variants('cv.rpartXse',se=c(0,0.5,1))),
               cvSettings(1,10,1234)
                                 )

## Get the maximum value of nmse for each learner
statScores(results,'nmse','max')
## Get the interquartile range of the mse score for each learner
statScores(results,'mse','IQR')



