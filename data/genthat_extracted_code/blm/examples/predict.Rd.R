library(blm)


### Name: predict
### Title: Get risk predictions for 'blm' and 'lexpit' objects.
### Aliases: predict.blm predict,blm-method predict,lexpit-method
### Keywords: methods

### ** Examples


data(ccdata)

fit <- lexpit(y~female, y~packyear, data = ccdata,
       			weight = ccdata$w, strata = ccdata$strata)

predict(fit)[1:10]



