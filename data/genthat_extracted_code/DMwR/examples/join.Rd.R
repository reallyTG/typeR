library(DMwR)


### Name: join
### Title: Merging several 'compExp' class objects
### Aliases: join
### Keywords: models

### ** Examples

## Run some experiments with the swiss data and tow different prediction models
data(swiss)

## First the user defined functions for obtaining the two models
cv.rpart <- function(form, train, test, ...) {
    model <- rpartXse(form, train, ...)
    preds <- predict(model, test)
    regr.eval(resp(form, test), preds,
              stats=c('mae','nmse'), train.y=resp(form, train))
}
cv.lm <- function(form, train, test, ...) {
    model <- lm(form, train, ...)
    preds <- predict(model, test)
    regr.eval(resp(form, test), preds,
              stats=c('mae','nmse'), train.y=resp(form, train))
}
## Now the evaluation of the two models, which will be done separately 
## just to illustrate the use of the join() function afterward
exp1 <- experimentalComparison(
               c(dataset(Infant.Mortality ~ ., swiss)),
               c(variants('cv.rpart',se=c(0,0.5,1))),
               cvSettings(1,10,1234))
exp2 <- experimentalComparison(
               c(dataset(Infant.Mortality ~ ., swiss)),
               c(variants('cv.lm')),
               cvSettings(1,10,1234))

## Now the examples of the join

## joining the two experiments by variants (i.e. models)
all <- join(exp1,exp2,by='variants')
bestScores(all)   # check the best results

## an example including also subsetting
bestScores(join(subset(exp1,stats='mae'),subset(exp2,stats='mae'),
                by='variants'))




