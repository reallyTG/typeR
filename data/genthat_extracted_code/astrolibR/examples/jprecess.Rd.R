library(astrolibR)


### Name: jprecess
### Title: Precess celestial positions from B1950.0 (FK4) to J2000.0 (FK5)
###   with proper motion
### Aliases: jprecess
### Keywords: misc

### ** Examples

#  The SAO catalogue gives the B1950 position and proper motion for the 
#  star HD 119288.   Find the J2000 position. 
#  RA(1950) = 13h 39m 44.526s      Dec(1950) = 8d 38' 28.63''  
#  Mu(RA) = -.0259 s/yr      Mu(Dec) = -.093 ''/yr
#  Result: 13h 42m 12.740s    +08d 23' 17.69"	

mu_radec = c(100*(-15)*0.0259, 100*(-0.093))
ra = ten(13,39,44.526)*15 
dec = ten(8,38,28.63)
result = jprecess(ra, dec, mu_radec = mu_radec)
result
adstring(result$ra2000, result$dec2000,2)
	


