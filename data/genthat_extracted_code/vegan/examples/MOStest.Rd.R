library(vegan)


### Name: MOStest
### Title: Mitchell-Olds & Shaw Test for the Location of Quadratic Extreme
### Aliases: MOStest plot.MOStest fieller.MOStest profile.MOStest
###   confint.MOStest
### Keywords: models regression

### ** Examples

## The Al-Mufti data analysed in humpfit():
mass <- c(140,230,310,310,400,510,610,670,860,900,1050,1160,1900,2480)
spno <- c(1,  4,  3,  9, 18, 30, 20, 14,  3,  2,  3,  2,  5,  2)
mod <- MOStest(mass, spno)
## Insignificant
mod
## ... but inadequate shape of the curve
op <- par(mfrow=c(2,2), mar=c(4,4,1,1)+.1)
plot(mod)
## Looks rather like log-link with Poisson error and logarithmic biomass
mod <- MOStest(log(mass), spno, family=quasipoisson)
mod
plot(mod)
par(op)
## Confidence Limits
fieller.MOStest(mod)
confint(mod)
plot(profile(mod))



