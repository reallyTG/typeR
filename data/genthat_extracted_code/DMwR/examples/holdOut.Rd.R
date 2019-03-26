library(DMwR)


### Name: holdOut
### Title: Runs a Hold Out experiment
### Aliases: holdOut
### Keywords: models

### ** Examples

## Estimating the mean absolute error and the normalized mean squared
## error of rpart on the swiss data, using 10 repetitions of 70%-30%
## Hold Out experiment
data(swiss)

## First the user defined function (note: can have any name)
hld.rpart <- function(form, train, test, ...) {
    require(rpart)
    model <- rpart(form, train, ...)
    preds <- predict(model, test)
    regr.eval(resp(form, test), preds,
              stats=c('mae','nmse'), train.y=resp(form, train))
}

## Now the evaluation
eval.res <- holdOut(learner('hld.rpart',pars=list()),
                            dataset(Infant.Mortality ~ ., swiss),
                            hldSettings(10,0.3,1234))

## Check a summary of the results
summary(eval.res)

## Plot them
## Not run: 
##D plot(eval.res)
## End(Not run)

## An illustration of the use of the itsInfo parameter.
## In this example the goal is to be able to check values predicted on
## each iteration of the experimental process (e.g. checking for extreme
## values)

## We need a different user-defined function that exports this
## information as an attribute
hld.rpart <- function(form, train, test, ...) {
    require(rpart)
    model <- rpart(form, train, ...)
    preds <- predict(model, test)
    eval.stats <- regr.eval(resp(form, test), preds,
                            stats=c('mae','nmse'),
                            train.y=resp(form,train))
    structure(eval.stats,itInfo=list(predictions=preds))
}

## Now lets run the experimental comparison
eval.res <- holdOut(learner('hld.rpart',pars=list()),
                            dataset(Infant.Mortality ~ ., swiss),
                            hldSettings(10,0.3,1234),
                            itsInfo=TRUE)

## getting the information with the predictions for all 10 repetitions
info <- attr(eval.res,'itsInfo')
## checking the predictions on the 5th repetition
info[[5]]



