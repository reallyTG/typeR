library(astrolibR)


### Name: precess
### Title: Precess coordinates from EQUINOX1 to EQUINOX2
### Aliases: precess
### Keywords: misc

### ** Examples


#  The Pole Star has J2000.0 coordinates (2h, 31m, 46.3s, 
#  89d 15' 50.6"); compute its coordinates at J1985.0
#  Result: 2h 16m 22.73s, 89d 11' 47.3"

precess(ten(2,31,46.3)*15, ten(89,15,50.6), 2000, 1985)


# Precess the B1950 coordinates of Eps Ind (RA = 21h 59m,33.053s,
# DEC = (-56d, 59', 33.053") to equinox B1975.

ra = ten(21, 59, 33.053)*15
dec = ten(-56, 59, 33.053)
precess(ra, dec , 1950, 1975, fk4=TRUE)



