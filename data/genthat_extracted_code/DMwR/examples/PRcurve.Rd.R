library(DMwR)


### Name: PRcurve
### Title: Plot a Precision/Recall curve
### Aliases: PRcurve
### Keywords: models

### ** Examples

## A simple example with data in package ROCR
library(ROCR)
data(ROCR.simple)
pred <- prediction(ROCR.simple$predictions,ROCR.simple$labels)
perf <- performance(pred,"prec","rec")
## The plot obtained with the standard ROCR functions
## Not run: 
##D plot(perf)
## End(Not run)

## Now our Precision/Recall curve avoiding the saw-tooth effect
## Not run: 
##D PRcurve(ROCR.simple$predictions,ROCR.simple$labels)
## End(Not run)



