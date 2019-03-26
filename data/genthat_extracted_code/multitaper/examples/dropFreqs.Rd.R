library(multitaper)


### Name: dropFreqs
### Title: Truncate mtm or mtm.coh Objects in Frequency
### Aliases: dropFreqs dropFreqs.default dropFreqs.spec dropFreqs.mtm
###   dropFreqs.mtm.coh
### Keywords: multitaper

### ** Examples

data(willamette)
mtm1 <- spec.mtm(willamette, nw=4.0, k=8, plot=FALSE, deltat=1.0, dtUnits="month")
mtm2 <- dropFreqs(mtm1, 0.1, 0.4)
plot(mtm2)

# another option
plot(dropFreqs(mtm1, 0.1, 0.4))

# using sine tapers
mtm.sine <- spec.mtm(willamette, k=10, plot=FALSE, deltat=1.0, dtUnits="month", 
                     taper="sine", sineAdaptive=FALSE, sineSmoothFact=0.05)
plot(dropFreqs(mtm.sine, 0.1, 0.4))                     



