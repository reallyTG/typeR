library(mixtools)


### Name: regmixmodel.sel
### Title: Model Selection in Mixtures of Regressions
### Aliases: regmixmodel.sel
### Keywords: file

### ** Examples

## Assessing the number of components for NOdata.

data(NOdata)
attach(NOdata)
set.seed(100)
regmixmodel.sel(x = NO, y = Equivalence, k = 3, type = "fixed")



