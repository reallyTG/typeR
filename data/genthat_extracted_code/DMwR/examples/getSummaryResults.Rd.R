library(DMwR)


### Name: getSummaryResults
### Title: Obtain a set of descriptive statistics of the results of a
###   learner
### Aliases: getSummaryResults
### Keywords: models

### ** Examples

## Estimating several evaluation metrics on different variants of a
## regression tree on  a data set, using one repetition of 10-fold CV
data(swiss)

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
               c(dataset(Infant.Mortality ~ ., swiss)),
               c(variants('cv.rpartXse',se=c(0,0.5,1))),
               cvSettings(1,10,1234)
                                 )

## Get the statistics of a specific learner
getSummaryResults(results,'cv.rpartXse.v1','swiss')

## Get the statistics of the learner that obtained the best NMSE on the
## swiss data set
getSummaryResults(results,bestScores(results)$swiss['nmse','system'],'swiss')




