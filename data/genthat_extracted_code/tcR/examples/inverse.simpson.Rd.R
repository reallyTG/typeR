library(tcR)


### Name: inverse.simpson
### Title: Distribution evaluation.
### Aliases: inverse.simpson diversity gini chao1 gini.simpson

### ** Examples

data(twb)
# Next two are equal calls:
stopifnot(gini(twb[[1]]$Read.count, TRUE, 0) - 0.7609971 < 1e-07)
stopifnot(gini(twb[[1]]$Read.proportion, FALSE) - 0.7609971 < 1e-07)
stopifnot(chao1(twb[[1]]$Read.count)[1] == 1e+04)



