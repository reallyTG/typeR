library(astrolibR)


### Name: hor2eq
### Title: Converts local horizon coordinates (alt-az) to equatorial
###   coordinates(ra-dec)
### Aliases: hor2eq
### Keywords: misc

### ** Examples

#   You are at Kitt Peak National Observatory, looking at a star at azimuth
#   angle 264d 55m 06s and elevation 37d 54m 41s (in the visible).  Today is
#   Dec 25, 2041 and the local time is 10 PM precisely.  What is the ra and dec
#   (J2000) of the star you're looking at?   The temperature here is about 0
#   Celsius, and the pressure is 781 millibars.    The Julian date for this
#   time is 2466879.7083333.
#   Result: ra=00h13m14.s  dec=+15d11'0.3"   ha=+03h3m30.1s
#   The star is Algenib
 
hor2eq(ten(37,54,41), ten(264,55,06), 2466879.7083333, lat=+31.9633, lon=-111.6)

# The program produces this output (because the VERBOSE keyword was set):
# Latitude = +31 57 48.0   Longitude = *** 36  0.0    longitude prints weirdly b/c of negative 
# input to ADSTRING!!
# Julian Date =  2466879.708333
# Az, El =  17 39 40.4  +37 54 41.0   (Observer Coords)
# Az, El =  17 39 40.4  +37 53 39.6   (Apparent Coords)
# LMST = +03 53 54.1
# LAST = +03 53 53.6
# Hour Angle = +03 38 30.1  (hh:mm:ss)
# Ra, Dec:  00 15 23.5  +15 25  1.9   (Apparent Coords)
# Ra, Dec:  00 15 24.2  +15 25  0.1   (J2041.9841)
# Ra, Dec:  00 13 14.1  +15 11  0.3   (J2000)
# The star is therefore Algenib!  Compare the derived Ra, Dec with what XEPHEM got:
# Ra, Dec:      00 13 14.2  +15 11  1.0   (J2000)



