library(heuristica)


### Name: rowPairApply
### Title: Apply functions to all row pairs.
### Aliases: rowPairApply

### ** Examples

## Fit two models to data.
data <- cbind(y=c(30,20,10,5), x1=c(1,1,0,0), x2=c(1,1,0,1))
ttb <- ttbModel(data, 1, c(2:ncol(data)))
lreg <- logRegModel(data, 1, c(2:ncol(data)))

## Generate predictions for all row pairs for these two models:
rowPairApply(data, heuristics(ttb, lreg))
## Returns a matrix of 2 columns, named ttbModel and regModel, and 6 rows.
## The original data had 4 rows, meaning there are 4*3/2 = 6 row pairs.

## To see which row pair is which row, use rowIndexes:
rowPairApply(data, rowIndexes(), heuristics(ttb, lreg))
## Returns a matrix with columns Row1, Row2, ttbModel, logRegModel.
## (RowIndexes returns *two* columns.)

## To see whether the first row was actually greater than the second in the
## row pair, use correctGreater and give it the criterion column index, in
## this case 1.
rowPairApply(data, heuristics(lreg, ttb), correctGreater(1))
## Returns a matrix with columns logRegModel, ttbModel,
## CorrectGreater.  Values are -1, 0, or 1.

## To do the same analysis for the *probabilty* that the first row is
## greater. use heuristicsProb and probGreater.  Warning: Not all heuristica
## models have implemented the prob greater function.
rowPairApply(data, heuristicsProb(lreg, ttb), probGreater(1))
## Returns a matrix with columns logRegModel, ttbModel, ProbGreater.
## Values range from 0.0 to 1.0.




