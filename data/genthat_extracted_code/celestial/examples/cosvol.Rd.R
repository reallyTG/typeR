library(celestial)


### Name: cosvol
### Title: Cosmological volume calculator
### Aliases: cosvol
### Keywords: cosmo cosmology volume

### ** Examples

#Approximate volume of the GAMA survey (area given in skyarea example, zmax is approx
#limit of main galaxy sample):
TotalGAMAvol=cosvol(293.82,0.6)[1]
print(paste('The GAMA survey volume is ~',round(TotalGAMAvol,2),'Gpc^3'))

#Approximate volume of SDSS (area given for DR7, zmax is approx limit of main galaxy sample):
TotalSDSSvol=cosvol(8423,0.3)[1]
print(paste('The SDSS survey volume is ~',round(TotalSDSSvol,2),'Gpc^3'))

#Change of reference cosmology
cosvol(293.82,0.6,ref='Planck')



