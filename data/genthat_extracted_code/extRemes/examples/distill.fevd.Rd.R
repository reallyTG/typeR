library(extRemes)


### Name: distill.fevd
### Title: Distill Parameter Information
### Aliases: distill.fevd distill.fevd.bayesian distill.fevd.lmoments
###   distill.fevd.mle
### Keywords: manip

### ** Examples


data(Fort)

fit <- fevd(Prec, Fort, threshold=0.395, type="PP", units="inches", verbose=TRUE)
fit

distill(fit)




