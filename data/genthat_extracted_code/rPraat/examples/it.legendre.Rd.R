library(rPraat)


### Name: it.legendre
### Title: it.legendre
### Aliases: it.legendre

### ** Examples

it <- it.sample()
it <- it.cut(it, tStart = 0.2, tEnd = 0.4)  # cut IntensityTier and preserve time
c <- it.legendre(it)
print(c)
leg <- it.legendreSynth(c)
itLeg <- it
itLeg$t <- seq(itLeg$tmin, itLeg$tmax, length.out = length(leg))
itLeg$i <- leg
## Not run: 
##D plot(it$t, it$i, xlab = "Time (sec)", ylab = "Intensity (dB)")
##D lines(itLeg$t, itLeg$i, col = "blue")
## End(Not run)



