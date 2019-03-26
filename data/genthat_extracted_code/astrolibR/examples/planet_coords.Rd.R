library(astrolibR)


### Name: planet_coords
### Title: Calculate low precision Right Ascension and declination for the
###   planets given a date
### Aliases: planet_coords
### Keywords: misc

### ** Examples

# Find the RA, Dec of Venus on 1992 Dec 20
# Result: RA = 21 05  2.66  Dec = -18 51 45.7

planet_coords(c(1992,12,20))    # compute for all planets
adstring(ra[2],dec[2],1)        # Venus is second planet
# This position is 37" from the full DE406 ephemeris position of
# RA = 21 05  5.24        -18 51 43.1

# Plot the declination of Mars for every day in the year 2001

jd = jdcnv(2001,1,1,0)      # get Julian date of midnight on Jan 1
out = planet_coords(jd+seq(0,365), planet='mars')     
plot(jd+seq(0,365), out$dec, pch=20, xlab='Day of 2001', ylab='Declination of Mars (degrees)')



