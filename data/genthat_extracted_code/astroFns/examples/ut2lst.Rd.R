library(astroFns)


### Name: ut2lst
### Title: Universal time to local sidereal time or hour angle
### Aliases: ut2lst ut2ha
### Keywords: chron

### ** Examples

# LST at UT1 midnight on the first of every month for Green Bank, WV, USA
midLST <- ut2lst(yr = 2012, mo = 1:12, dy = 1, hr = 0, mi = 0, se = 0,
                 lon.obs="W 79d 50.5m")
str(midLST)
midLST

# LST at EST midnight on the first of every month for Green Bank, WV, USA
# (EST = UT1-5 hours)
midLST <- ut2lst(yr = 2012, mo = 1:12, dy = 1, hr = -5, mi = 0, se = 0,
                 lon.obs="W 79d 50.5m")
str(midLST)
midLST

# LST in Green Bank, WV, USA, now, and 12 hours from now.
ut2lst(Sys.time())
ut2lst(Sys.time() + 12*3600)

# Hour angle of 3C286 in Green Bank now (using function defaults)
ut2ha(Sys.time())




