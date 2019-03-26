library(renpow)


### Name: Solar Power
### Title: Solar Power Functions
### Aliases: solarpower I0.orbit days.mo declination sun.elev read.tau
###   beam.diffuse I0.blackbody spectral useful.waste sun.path sun.diagram
###   collector month.prod tilt.adj one.axis.tracking two.axis.tracking
### Keywords: hplot dplot math

### ** Examples


I0.orbit()
declination()

x <- declination(plot=FALSE)
sun.elev(x,lat=32.9)

tau <- tauGolden
# or alternatively
# tau <- read.tau(system.file("extdata","tauGolden.csv",package="renpow"))
Ibd <- beam.diffuse(tau)

I0.blackbody(T.sun=5800,wl.nm=seq(150,2500))









