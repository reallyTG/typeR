library(psychomix)


### Name: effectsplot
### Title: Effects Displays for Concomitant Variables in Finite Mixture
###   Models
### Aliases: effectsplot effectsplot.efflist effectsplot.effpoly
###   allEffects.btmix allEffects.mptmix allEffects.raschmix effect.btmix
###   effect.mptmix effect.raschmix effectsplot,raschmix-method
###   effectsplot,btmix-method effectsplot,mptmix-method
### Keywords: hplot effects plot

### ** Examples

## No test: 
## data on party preferences in Germany
## (omit single observation with education = 1)
data("GermanParties2009", package = "psychotools")
gp <- subset(GermanParties2009, education != "1")
gp$education <- factor(gp$education)

## fit Bradley-Terry mixture, see ?btmix for more details
## and a fully-worked example
set.seed(2)
cm4 <- btmix(preference ~ gender + education + age + crisis, data = gp, k = 4, nrep = 1)

## inspect mixture and effects
library("lattice")
xyplot(cm4)
effectsplot(cm4)

## vis effects package directly
if(require("effects")) {
eff4 <- allEffects(cm4)
plot(eff4)
}
## End(No test)



