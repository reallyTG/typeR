library(distrEllipse)


### Name: distrEllipseoptions
### Title: functions to change the global variables of the package
###   'distrEllipse'
### Aliases: distrEllipseoptions getdistrEllipseOption Nsim withED lwd.Ed
###   col.Ed withMean cex.mean pch.mean col.mean
### Keywords: distribution

### ** Examples

distrEllipseoptions("Nsim") # returns the value of Nsim, by default = 5
currentDistrOptions <- distrEllipseoptions()
distrEllipseoptions(Nsim = 6000)
distrEllipseoptions("Nsim")
getdistrEllipseOption("Nsim")
distrEllipseoptions(c("Nsim","withED"))



