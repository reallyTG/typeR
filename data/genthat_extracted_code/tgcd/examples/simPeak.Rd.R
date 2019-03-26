library(tgcd)


### Name: simPeak
### Title: Thermoluminescence glow peak simulation
### Aliases: simPeak simPeak.default
### Keywords: package tgcd Thermoluminescence Glow peak simulation

### ** Examples

  
   # Simulate second-order glow peaks with various 
   # initial electron trap concentration (n0).
    temps <- seq(400, 600, by=0.5)
    peak1 <- simPeak(temps, n0=0.2e10, Nn=1e10, 
      ff=1e19, ae=2.0, hr=1, typ="s")
    peak2 <- simPeak(temps, n0=0.4e10, Nn=1e10, 
      ff=1e19, ae=2.0, hr=1, typ="s")
    peak3 <- simPeak(temps, n0=0.6e10, Nn=1e10, 
      ff=1e19, ae=2.0, hr=1, typ="s")
    peak4 <- simPeak(temps, n0=0.8e10, Nn=1e10, 
      ff=1e19, ae=2.0, hr=1, typ="s")
    peak5 <- simPeak(temps, n0=1.0e10, Nn=1e10, 
      ff=1e19, ae=2.0, hr=1, typ="s")
    peaks <- cbind(peak1$tl, peak2$tl, peak3$tl, peak4$tl, peak5$tl)
    matplot(temps, peaks, type="l", lwd=2, lty="solid", 
      xlab="Temperature (K)", ylab="TL intensity (counts)")




