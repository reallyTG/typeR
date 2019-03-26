library(astrolibR)


### Name: moonpos
### Title: Compute the Right Ascension and Declination of the Moon at
###   specified Julian date(s)
### Aliases: moonpos
### Keywords: misc

### ** Examples

# Find the position of the moon on April 12, 1992
# Result: 08 58 45.23  +13 46  6.1
# This is within 1" from the position given in the Astronomical Almanac

jd = jdcnv(1992,4,12,0)    # get Julian date
pos = moonpos(jd)     # get RA and Dec of moon
adstring(pos$ra,pos$dec,1)


# Plot the Earth-moon distance for every day at 0 TD in July, 1996

jd = jdcnv(1996,7,1,0)  # get Julian date of July 1
pos = moonpos(jd+rep(0,31))  # Moon position at all 31 days
plot(seq(1,31), pos$dis, xlab="July 1996 (day)", ylab="Lunar distance (km)")



