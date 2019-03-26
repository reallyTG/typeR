library(lira)


### Name: distance.LCDM
### Title: Angular diameter distance in a LCDM universe
### Aliases: distance.LCDM
### Keywords: cosmology

### ** Examples

# Distance to a source at z=1 in a standard cosmology,
distance.LCDM(z=1.0) 
# Distance between a lens at zl=0.3 and a source at z=1 in an open cosmology,
distance.LCDM(0.3,1,Omega.M0=0.2,Omega.L0=0.7)



