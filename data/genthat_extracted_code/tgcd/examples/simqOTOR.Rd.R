library(tgcd)


### Name: simqOTOR
### Title: Thermoluminescence glow peak simulation
### Aliases: simqOTOR simqOTOR.default
### Keywords: package tgcd Thermoluminescence Glow peak simulation

### ** Examples


    # Synthesizing a glow curve consisting of five glow peaks.
     temps <- seq(330, 730, by=0.5)
     peak1 <- simqOTOR(temps, n0=0.7e10, Nn=1e10, Ah=1e-3, An=1e-7,
       ff=1e14, ae=1.5, hr=1, outfile = NULL, plot = TRUE)
     peak2 <- simqOTOR(temps, n0=0.5e10, Nn=1e10, Ah=1e-7, An=1e-7,
       ff=1e17, ae=1.9, hr=1, outfile = NULL, plot = TRUE)
     peak3 <- simqOTOR(temps, n0=0.2e10, Nn=1e10, Ah=1e-5, An=1e-7,
       ff=1e15, ae=1.45, hr=1, outfile = NULL, plot = TRUE)
     peak4 <- simqOTOR(temps, n0=0.2e10, Nn=1e10, Ah=1e-5, An=1e-7,
       ff=1e9, ae=0.85, hr=1, outfile = NULL, plot = TRUE)
     peak5 <- simqOTOR(temps, n0=0.3e10, Nn=1e10, Ah=1e-7, An=1e-7,
       ff=1e11, ae=1.4, hr=1, outfile = NULL, plot = TRUE)
     peaks <- cbind(peak1$tl, peak2$tl, peak3$tl, peak4$tl, peak5$tl, 
       peak1$tl+peak2$tl+peak3$tl+peak4$tl+peak5$tl)
     matplot(temps, y=peaks, type="l", lwd=2, lty="solid", 
       xlab="Temperature (K)", ylab="TL intensity (counts)")



