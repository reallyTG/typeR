library(lmtest)


### Name: grangertest
### Title: Test for Granger Causality
### Aliases: grangertest grangertest.default grangertest.formula
### Keywords: htest

### ** Examples

## Which came first: the chicken or the egg?
data(ChickEgg)
grangertest(egg ~ chicken, order = 3, data = ChickEgg)
grangertest(chicken ~ egg, order = 3, data = ChickEgg)

## alternative ways of specifying the same test
grangertest(ChickEgg, order = 3)
grangertest(ChickEgg[, 1], ChickEgg[, 2], order = 3)



