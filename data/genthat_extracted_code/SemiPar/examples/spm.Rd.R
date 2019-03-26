library(SemiPar)


### Name: spm
### Title: Fit a SemiParametric regression Model
### Aliases: spm
### Keywords: nonlinear models smooth regression

### ** Examples

library(SemiPar)
data(fossil)
attach(fossil)
fit <- spm(strontium.ratio~f(age))
plot(fit)
summary(fit)

data(calif.air.poll)
attach(calif.air.poll)
fit <- spm(ozone.level ~ f(daggett.pressure.gradient)+
                         f(inversion.base.height) +
                         f(inversion.base.temp))
summary(fit)
par(mfrow=c(2,2))
plot(fit)

# The SemiPar User Manual contains several other examples
# and details of plotting parameters.
#
# The current version of the manual is posted on the web-site:
#
#     http://matt-wand.utsacademics.info/SPmanu.pdf



