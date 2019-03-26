library(ordinal)


### Name: predict.clm
### Title: Predict Method for CLM fits
### Aliases: predict.clm
### Keywords: models

### ** Examples


## simple model:
fm1 <- clm(rating ~ contact + temp, data=wine)
summary(fm1)

## Fitted values with standard errors and confidence intervals:
predict(fm1, se.fit=TRUE, interval=TRUE) # type="prob"
## class predictions for the observations:
predict(fm1, type="class")

newData <- expand.grid(temp = c("cold", "warm"),
                       contact = c("no", "yes"))

## Predicted probabilities in all five response categories for each of
## the four cases in newData:
predict(fm1, newdata=newData, type="prob")
## now include standard errors and intervals:
predict(fm1, newdata=newData, se.fit=TRUE, interval=TRUE, type="prob")





