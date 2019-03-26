library(demogR)


### Name: goodman
### Title: Demographic data from Venezuela, Madagascar and the United
###   States in the late 1960s
### Aliases: goodman
### Keywords: datasets

### ** Examples

data(goodman)
## Plot age-specific mortality rates for the three populations
with(goodman, plot(age, usa.nDx/usa.nKx, type="l", log="y", xlab="Age", ylab="nMx"))
with(goodman, lines(age, mad.nDx/mad.nKx, lty=2))
with(goodman, lines(age, ven.nDx/ven.nKx, lty=3))
legend("bottomright", c("USA","Madagascar","Venezuela"), lty=c(1,2,3))




