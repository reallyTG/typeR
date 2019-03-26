library(DMwR)


### Name: getVariant
### Title: Obtain the learner associated with an identifier within a
###   comparison
### Aliases: getVariant
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
## Get the best scores
bestScores(results)

# Obtain the settings corresponding to one of the variants
getVariant('cv.rpartXse.v1',results)

# Obtain the settings of the learner that got the best NMSE score on the
# swiss data set
getVariant(bestScores(results)$swiss['nmse','system'],results)




