library(mice)


### Name: densityplot.mids
### Title: Density plot of observed and imputed data
### Aliases: densityplot.mids densityplot
### Keywords: hplot

### ** Examples

imp <- mice(boys, maxit=1)

### density plot of head circumference per imputation
### blue is observed, red is imputed
densityplot(imp, ~hc|.imp)

### All combined in one panel.
densityplot(imp, ~hc)




