library(breakage)


### Name: resist.cone
### Title: Calculate resistance of a truncated conical conductor
### Aliases: resist.cone

### ** Examples

# resistance of truncated conical segment 30 microns long, with end radii 50nm and 500nm
# filled with solution of resistivity 64 ohm cm
# converting result from ohms to megohms for readability
resist.cone(l=30, r1=0.05, r2=0.5, rho=64) * 1e-6



