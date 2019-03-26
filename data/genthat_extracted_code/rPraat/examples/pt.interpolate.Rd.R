library(rPraat)


### Name: pt.interpolate
### Title: pt.interpolate
### Aliases: pt.interpolate

### ** Examples

pt <- pt.sample()
pt <- pt.Hz2ST(pt, ref = 100)  # conversion of Hz to Semitones, reference 0 ST = 100 Hz.
pt2 <- pt.interpolate(pt, seq(pt$t[1], pt$t[length(pt$t)], by = 0.001))
## Not run: 
##D pt.plot(pt)
##D pt.plot(pt2)
## End(Not run)



