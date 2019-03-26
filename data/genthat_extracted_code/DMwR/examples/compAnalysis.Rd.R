library(DMwR)


### Name: compAnalysis
### Title: Analyse and print the statistical significance of the
###   differences between a set of learners.
### Aliases: compAnalysis
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

## Testing the statistical significance of the differences
compAnalysis(results)

## Comparing against the learner with best NMSE, and only on that statistic
compAnalysis(results,against=bestScores(results)$swiss['nmse','system'],
             stats='nmse')



