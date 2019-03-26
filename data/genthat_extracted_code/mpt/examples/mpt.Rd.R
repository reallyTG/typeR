library(mpt)


### Name: mpt
### Title: Multinomial Processing Tree (MPT) Models
### Aliases: mpt anova.mpt coef.mpt confint.mpt predict.mpt print.mpt
###   summary.mpt print.summary.mpt
### Keywords: models

### ** Examples

## Storage-retrieval model for pair clustering (Riefer & Batchelder, 1988)
data(retroact)

spec <- mptspec(
  c*r,
  (1 - c)*u^2,
  2*(1 - c)*u*(1 - u),
  c*(1 - r) + (1 - c)*(1 - u)^2,
  u,
  1 - u
)
mpt1 <- mpt(spec, retroact[retroact$lists == 0, ])

summary(mpt1)  # parameter estimates, goodness of fit
plot(mpt1)     # residuals versus predicted values
confint(mpt1)  # approximate confidence intervals

plot(coef(mpt1), axes=FALSE, ylim=0:1, pch=16, xlab="",
     ylab="Parameter estimate (MPT model, 95% CI)")
axis(1, 1:3, names(coef(mpt1))); axis(2)
arrows(1:3, plogis(confint(mpt1))[,1], 1:3, plogis(confint(mpt1))[,2],
       .05, 90, 3)

## See ?retroact, ?proact, and ?prospecMemory for further examples.



