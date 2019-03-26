library(sads)


### Name: fitrad-class
### Title: Class '"fitrad"' for maximum likelihood fitting of species
###   rank-abundance distributions
### Aliases: fitrad-class plot,fitrad,ANY-method show,fitrad-method
###   pprad,fitrad,missing,missing-method
###   pprad,fitrad,missing,missing,missing,missing-method
###   qqrad,fitrad,missing,missing,missing,missing-method
### Keywords: classes

### ** Examples

ok.gser <- fitrad(okland, "gs")
## The class has a plot method to show diagnostic plots
par(mfrow=c(2,2))
plot(ok.gser)
# The same plot, but with relative abundances
plot(ok.gser, prop = TRUE)
par(mfrow=c(1,1))
## Some useful methods inherited from mle2-class
coef(ok.gser)
confint(ok.gser)
logLik(ok.gser)
## Model selection
ok.zipf <- fitrad(okland, "zipf")
AICctab(ok.gser, ok.zipf, nobs=length(moths), base=TRUE)



