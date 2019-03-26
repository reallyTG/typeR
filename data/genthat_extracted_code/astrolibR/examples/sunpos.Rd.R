library(astrolibR)


### Name: sunpos
### Title: Compute the Right Ascension and Declination of the Sun at
###   specified Julian date(s)
### Aliases: sunpos
### Keywords: misc

### ** Examples

# Find the apparent RA and Dec of the Sun on May 1, 1982
# Result:  02 31 32.61  +14 54 34.9 
# The Astronomical Almanac gives 02 31 32.58 +14 54 34.9,
# so the error in sunpos for this case is < 0.5".
       
jd = jdcnv(1982, 5, 1,0)      # Find Julian date jd = 2445090.5   
out = sunpos(jd)  

  
# Plot the apparent declination of the Sun for every day in 1997

jd = jdcnv(1997,1,1,0)  # Julian date on Jan 1, 1997
days = seq(0,365)  
plot(days, sunpos(jd+days)$dec, type='b', pch=20, lwd=2) 



