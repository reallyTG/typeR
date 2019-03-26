library(mosum)


### Name: confint.mosum.cpts
### Title: Confidence intervals for change-points
### Aliases: confint.mosum.cpts

### ** Examples

set.seed(1337)
x <- testData(lengths=rep(100, 3), means=c(0, 3, 1), sds=rep(1, 3))
m <- mosum(x, G=40)
ci <- confint(m, N_reps=5000)
print(ci$CI)



