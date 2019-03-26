library(breakage)


### Name: resist.total
### Title: Calculate overall pipette tip resistance
### Aliases: resist.total

### ** Examples

# total resistance for a 30 micron long pipette tip with a half-cone angle of 4 degrees
# and a tip radius of 50nm, with a filler/bath resistivity of 64 ohm cm
# converting result from ohms to megohms for readability
resist.total(r=0.05, l=30, theta=4*pi/180, rho=64) * 1e-6



