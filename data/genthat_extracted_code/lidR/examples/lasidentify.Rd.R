library(lidR)


### Name: laspulse
### Title: Retrieve individual pulses, flightlines or scanlines
### Aliases: laspulse lasflightline lasscanline

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las <- readLAS(LASfile)

las <- laspulse(las)
las

las <- lasflightline(las)
plot(las, color = "flightlineID")



