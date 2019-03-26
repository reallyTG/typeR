library(basicspace)


### Name: predict.aldmck
### Title: Predict method of aldmck objects
### Aliases: predict.aldmck
### Keywords: multivariate

### ** Examples

## Estimate an aldmck object from example and call predict function
data(LC1980)
result <- aldmck(data=LC1980, polarity=2, respondent=1, missing=c(0,8,9),verbose=TRUE)
prediction <- predict.aldmck(result)

## Examine predicted vs. observed values for first 10 respondents
## Note some observations are NA'd in prediction matrix from caliper
## First column of LC1980 are self-placements, which are excluded
LC1980[1:10,-1]
prediction[1:10,]

## Check correlation across all predicted vs. observed, excluding missing values
prediction[which(LC1980[,-1] %in% c(0,8,9))] <- NA
cor(as.numeric(prediction), as.numeric(LC1980[,-1]), use="pairwise.complete")



