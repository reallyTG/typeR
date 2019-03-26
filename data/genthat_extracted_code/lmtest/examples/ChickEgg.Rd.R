library(lmtest)


### Name: ChickEgg
### Title: Chickens, Eggs, and Causality
### Aliases: ChickEgg
### Keywords: datasets

### ** Examples

## Which came first: the chicken or the egg?
data(ChickEgg)
## chickens granger-cause eggs?
grangertest(egg ~ chicken, order = 3, data = ChickEgg)
## eggs granger-cause chickens?
grangertest(chicken ~ egg, order = 3, data = ChickEgg)

## To perform the same tests `by hand', you can use dynlm() and waldtest():
if(require(dynlm)) {
  ## chickens granger-cause eggs?
  em <- dynlm(egg ~ L(egg, 1) + L(egg, 2) + L(egg, 3), data = ChickEgg)
  em2 <- update(em, . ~ . + L(chicken, 1) + L(chicken, 2) + L(chicken, 3))
  waldtest(em, em2)

  ## eggs granger-cause chickens?
  cm <- dynlm(chicken ~ L(chicken, 1) + L(chicken, 2) + L(chicken, 3), data = ChickEgg)
  cm2 <- update(cm, . ~ . + L(egg, 1) + L(egg, 2) + L(egg, 3))
  waldtest(cm, cm2)
}



