library(wiqid)


### Name: richCurve
### Title: Species richness estimates based on accumulation curves
### Aliases: richCurve richSobs richSingle richDouble richUnique
###   richDuplicate

### ** Examples

data(seedbank)
plot(richCurve(seedbank, richSobs)$mean, type='l', ylim=c(0, 35))
lines(richCurve(seedbank, richSingle)$mean, col='blue')
lines(richCurve(seedbank, richDouble)$mean, col='blue', lty=2)



