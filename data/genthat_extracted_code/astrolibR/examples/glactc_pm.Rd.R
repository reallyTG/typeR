library(astrolibR)


### Name: glactc_pm
### Title: Convert between celestial and Galactic (or Supergalactic) proper
###   motion and coordinates
### Aliases: glactc_pm
### Keywords: misc

### ** Examples

# Find the SuperGalactic proper motion of M33 given its
#  equatorial proper motion mu* =(-29.2, 45.2) microas/yr.
#  Here the (*) indicates ra component is actual mu_ra*cos(dec) 
#	(Position: RA (J2000): 01 33 50.9, Dec (J2000): 30 39 35.8)
# Result: SGL = 328.46732 deg, SGB = -0.089896901 deg
#			mu_sgl = 35.02 microarcsecond/yr, mu_sgb = 38.09 microarcsecond/yr.

glactc_pm(ten(1,33,50.9), ten(30,39,35.8), -29.2, 45.2, 2000, 
     gl, gb, mu_gl, mu_gb, 1)



