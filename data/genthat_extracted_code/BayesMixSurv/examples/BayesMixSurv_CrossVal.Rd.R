library(BayesMixSurv)


### Name: bayesmixsurv.crossval
### Title: Convenience functions for cross-validation-based selection of
###   shrinkage parameter in the bayesmixsurv model.
### Aliases: bayesmixsurv.crossval bayesmixsurv.crossval.wrapper
###   bayesmixsurv.generate.folds bayesmixsurv.generate.folds.eventbalanced
### Keywords: ~kwd1 ~kwd2

### ** Examples

# NOTE: to ensure convergence, typically more than 30 samples are needed
folds <- bayesmixsurv.generate.folds.eventbalanced(Surv(futime, fustat) ~ 1, ovarian, 5)
cv <- bayesmixsurv.crossval(ovarian, folds, formula1=Surv(futime, fustat) ~ ecog.ps + rx
  , control=bayesmixsurv.control(iter=30, nskip=10), print.level = 3)
cv2 <- bayesmixsurv.crossval.wrapper(ovarian, folds, formula1=Surv(futime, fustat) ~ ecog.ps + rx
  , control=bayesmixsurv.control(iter=30, nskip=10)
  , lambda1.vec=exp(seq(from=log(0.1), to=log(1), length.out = 3)))



