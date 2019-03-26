library(apricom)


### Name: ols.rgr
### Title: Linear Regression using Ordinary Least Squares
### Aliases: ols.rgr

### ** Examples

## Linear regression using a subset of the mtcars data (outcome is "wt")
data(mtcars)
mtc.df <- mtcars[, c(6, 1, 4)]
mtc.shaped <- datashape(dataset = mtc.df, y = 1)
ols.rgr(mtc.shaped)
ols.rgr(cbind(1,mtc.shaped))



