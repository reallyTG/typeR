library(mosum)


### Name: confint.multiscale.cpts
### Title: Confidence intervals for change-points
### Aliases: confint.multiscale.cpts

### ** Examples

set.seed(1337)
x <- testData(lengths=rep(100, 3), means=c(0, 3, 1), sds=rep(1, 3))
mlp <-  multiscale.localPrune(x, G=c(8, 15, 30, 70))
ci <- confint(mlp, N_reps=5000)
print(ci$CI)



