library(astrolibR)


### Name: helio_rv
### Title: Calculate the heliocentric radial velocity of a spectroscopic
###   binary
### Aliases: helio_rv
### Keywords: misc

### ** Examples

# What was the heliocentric radial velocity of the primary component of HU Tau
# at 1730 UT 25 Oct 1994?
# Result: -63.66 km/s

jd <- juldate(c(94,10,25,17,30))   #  obtain Geocentric julian date
hjd <- helio_jd(jd, ten(04,38,16)*15., ten(20,41,05)) #  convert to HJD
helio_rv(hjd, 46487.5303, 2.0563056, -6.0, 59.3)

# Plot two cycles of an eccentric orbit, e=0.6, omega=45 for both
# components of a binary star

phase <- seq(0.0,2.0,length=100)   #  generate 100 phase points
plot(phase, helio_rv(phase, 0, 1, 0, 100, 0.6, 45)$rv, ylim=c(-100,150), pch=20)
lines(phase, helio_rv(phase, 0, 1, 0, 50, 0.6, 45+180)$rv)



