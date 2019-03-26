library(renpow)


### Name: Tidal Power
### Title: Tidal Power Functions
### Aliases: tidalpower read.tide harmonics.tide power.barrage.cycle
###   find.peaks tide.current.abs tidal.power
### Keywords: hplot dplot math

### ** Examples


# using extdata
x <- read.tide(system.file("extdata","AnchorageTide.csv",package = "renpow"))
harmonics.tide(x,days=29)

x <- read.tide(system.file("extdata","VelocityTide.csv",package="renpow"))
y <- harmonics.tide(x, days=15,ylabel="Velocity m/s)")
tide.current.abs(y, ylabel="Velocity (abs val) (m/s)", plot=TRUE)
y <- harmonics.tide(x, days=365,ylabel="Velocity m/s)",plot=FALSE)
z <- tide.current.abs(y, ylabel="Current abs (m/s)", plot=TRUE)
tidal.power(z,Aflow=1)

x <- read.tide(system.file("extdata","ElevationTide.csv",package="renpow"))
y <- harmonics.tide(x,days=29)
y <- harmonics.tide(x,days=365)
z <- find.peaks(y, band=c(0,1))




