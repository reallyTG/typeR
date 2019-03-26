library(analogue)


### Name: performance
### Title: Transfer function model performance statistics
### Aliases: performance print.performance performance.wa
###   performance.predict.wa performance.bootstrap.wa performance.crossval
### Keywords: methods utilities

### ** Examples

data(ImbrieKipp)
data(SumSST)

## fit the WA model
mod <- wa(SumSST ~., data = ImbrieKipp)
mod

## the model performance statistics
performance(mod)



