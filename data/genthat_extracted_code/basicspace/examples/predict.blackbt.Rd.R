library(basicspace)


### Name: predict.blackbt
### Title: Predict method of blackbt objects
### Aliases: predict.blackbt
### Keywords: multivariate

### ** Examples

## Estimate blackbt object from example and call predict function
data(LC1980)
data(LC1980_bbt)
prediction <- predict.blackbt(LC1980_bbt, dims=2)

## Examine predicted vs. observed values for first 10 respondents
## First column of LC1980 are self-placements, which are excluded
LC1980[1:10,-1]
prediction[1:10,]

## Check correlation across all predicted vs. observed, excluding missing values
prediction[which(LC1980[,-1] %in% c(0,8,9))] <- NA
cor(as.numeric(prediction), as.numeric(LC1980[,-1]), use="pairwise.complete")



