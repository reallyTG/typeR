library(BSGW)


### Name: bsgw.crossval
### Title: Convenience functions for cross-validation-based selection of
###   shrinkage parameter in the bsgw model.
### Aliases: bsgw.crossval bsgw.crossval.wrapper bsgw.generate.folds
###   bsgw.generate.folds.eventbalanced

### ** Examples

library("survival")
data(ovarian)
folds <- bsgw.generate.folds.eventbalanced(Surv(futime, fustat) ~ 1, ovarian, 5)
cv <- bsgw.crossval(ovarian, folds, formula=Surv(futime, fustat) ~ ecog.ps + rx
  , control=bsgw.control(iter=50, nskip=10), print.level = 3)
cv2 <- bsgw.crossval.wrapper(ovarian, folds, formula=Surv(futime, fustat) ~ ecog.ps + rx
  , control=bsgw.control(iter=50, nskip=10)
  , print.level=3, lambda.vec=exp(seq(from=log(0.1), to=log(1), length.out = 3)))



