library(DMwR)


### Name: slidingWindowTest
### Title: Obtain the predictions of a model using a sliding window
###   learning approach.
### Aliases: slidingWindowTest
### Keywords: models

### ** Examples

data(swiss)

## Obtain the predictions of model rpartXse() for the last 22 rows of
## the swiss data set, when used with a sliding window of 25 cases with
## a relearning step of 3

## The base learner used in the experiment
learnAndTest.rpartXse <- function(form, train, test, ...) {
    model <- rpartXse(form, train, ...)
    predict(model, test)
}

preds <- slidingWindowTest(learner('learnAndTest.rpartXse',pars=list(se=0.5)),
                           Infant.Mortality ~ .,
                           swiss[1:25,],
                           swiss[26:nrow(swiss),],
                           3)

## Some statistics of these predictions
regr.eval(swiss[26:nrow(swiss),'Infant.Mortality'],preds,stats = c("mae", "mse", "rmse"))



