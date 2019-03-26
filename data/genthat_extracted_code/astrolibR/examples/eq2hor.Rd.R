library(astrolibR)


### Name: eq2hor
### Title: Convert celestial (ra-dec) coords to local horizon coords
###   (alt-az)
### Aliases: eq2hor
### Keywords: misc

### ** Examples

# Find the position of the open cluster NGC 2264 at the Effelsburg Radio
# Telescope in Germany, on June 11, 2023, at local time 22:00 (METDST).
# The inputs will then be:
#   Julian Date = 2460107.250
#   Latitude = 50d 31m 36s
#   Longitude = 06h 51m 18s
#   Altitude = 369 meters
#   RA (J2000) = 06h 40m 58.2s
#   Dec(J2000) = 09d 53m 44.0s

eq2hor(ten(6,40,58.2)*15., ten(9,53,44), 2460107.250, 
       lat=ten(50,31,36), lon=ten(6,51,18), altitude=369.0, 
       pres=980.0, temp=283.0)

# Output expected: 
# Az = 17 42 25.6  
# El = +16 28 22.8
# Hour Angle = +05 04 27.6 



