library(DMwR)


### Name: loocv
### Title: Run a Leave One Out Cross Validation Experiment
### Aliases: loocv
### Keywords: models

### ** Examples

## Estimating the mean absolute error and the normalized mean squared
## error of rpart on the swiss data, using one repetition of 10-fold CV
data(swiss)

## First the user defined function (note: can have any name)
user.rpart <- function(form, train, test, ...) {
    require(rpart)
    model <- rpart(form, train, ...)
    preds <- predict(model, test)
    regr.eval(resp(form, test), preds,
              stats=c('mae','nmse'), train.y=resp(form, train))
}

## Now the evaluation
eval.res <- loocv(learner('user.rpart',pars=list()),
                  dataset(Infant.Mortality ~ ., swiss),
                  loocvSettings(1234))

## Check a summary of the results
summary(eval.res)

## Plot them
## Not run: 
##D plot(eval.res)
## End(Not run)



