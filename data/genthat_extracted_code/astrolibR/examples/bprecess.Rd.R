library(astrolibR)


### Name: bprecess
### Title: Precess celestial positions from J2000.0 (FK5) to B1950.0 (FK4)
### Aliases: bprecess
### Keywords: misc

### ** Examples

# The star HD 119288 has
# RA(2000) = 13h 42m 12.740s Dec(2000) = 8d 23' 17.69'' 
#   Mu(RA) = -.0257 s/yr Mu(Dec) = -.090 ''/yr 

mu_radec=100*c(-15*0.257, -0.090)
ra = ten(13, 42, 12.740)*15.
dec = ten(8,23,17.69)
bprecess(ra, dec, mu_radec) 




