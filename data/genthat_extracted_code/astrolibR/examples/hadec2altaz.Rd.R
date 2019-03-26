library(astrolibR)


### Name: hadec2altaz
### Title: Convert Hour Angle and Declination to Horizon (alt-az)
###   coordinates
### Aliases: hadec2altaz
### Keywords: misc

### ** Examples

# What were the apparent altitude and azimuth of the sun when it transited 
# the local meridian at Pine Bluff Observatory (Lat=+43.07833 degrees) on 
# April 21, 2002?   An object transits the local meridian at 0 hour angle.
# Assume this will happen at roughly 1 PM local time (18:00 UTC).
# Result: Altitude alt = 58.90,  Azimuth  az = 180.0

jd <- jdcnv(2002, 4, 21, 18.) # get rough Julian date to determine Sun declination
sun_pos <- sunpos(jd)
hadec2altaz(0., sun_pos$dec, 43.078333)



