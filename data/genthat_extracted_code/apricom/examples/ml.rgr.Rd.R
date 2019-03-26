library(apricom)


### Name: ml.rgr
### Title: Logistic Regression with Maximum Likelihood Estimation
### Aliases: ml.rgr

### ** Examples

## Logistic regression using a subset of the mtcars data (outcome is "vs")
data(mtcars)
mtc.df <- mtcars[, c(8, 1, 9)]
mtc.shaped <- datashape(dataset = mtc.df, y = 1)
ml.rgr(mtc.shaped)
ml.rgr(cbind(1,mtc.shaped))



