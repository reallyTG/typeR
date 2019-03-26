library(DMwR)


### Name: monteCarlo
### Title: Run a Monte Carlo experiment
### Aliases: monteCarlo
### Keywords: models

### ** Examples

## The following is an example of a possible approach to a time series
## problem, although in this case the used data is clearly not a time
## series being selected only for illustration purposes

data(swiss)


## The base learner used in the experiment
mc.rpartXse <- function(form, train, test, ...) {
    model <- rpartXse(form, train, ...)
    preds <- predict(model, test)
    regr.eval(resp(form, test), preds,
              stats=c('mae','nmse'), train.y=resp(form, train))
}

## Estimate the MAE and NMSE of the learner rpartXse when asked to
## obtain predictions for a test set with 10 observations given a
## training set with 20 observations. The predictions for the 10
## observations are obtained using a sliding window learn+test approach
## (see the help of function slidingWindowTest() ) with a
## model re-learning step of 5 observations.
## Estimates are obtained by repeating 10 times the train+test process

x <- monteCarlo(learner("slidingWindowTest",
                      pars=list(learner=learner("mc.rpartXse",pars=list(se=1)),
                                relearn.step=5
                               )
                        ),
                      dataset(Infant.Mortality ~ ., swiss),
                      mcSettings(10,20,10,1234)
                 )

summary(x)



