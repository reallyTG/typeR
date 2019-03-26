library(celestial)


### Name: coshalo
### Title: Virial halo conversion functions
### Aliases: coshalo coshaloMvirToSigma coshaloSigmaToMvir
###   coshaloMvirToRvir coshaloRvirToMvir coshaloSigmaToRvir
###   coshaloRvirToSigma coshaloSigmaToTvir
### Keywords: halo cosmo cosmology

### ** Examples

coshaloMvirToSigma(1e13) # Velocity in km/s
coshaloMvirToSigma(1e13, Vunit=1) # Velocity in m/s
coshaloSigmaToMvir(coshaloMvirToSigma(1e13, Vunit=1),Vunit=1)
coshaloMvirToRvir(1e13) #Radius in kpc
coshaloSigmaToRvir(coshaloMvirToSigma(1e13, Vunit=1),Vunit=1)

#Some sanity checks

rho_crit200=cosgrowRhoCrit(z=0)*200 #200 times rho critical at z=0
rho_mean200=cosgrowRhoMean(z=0)*200 #200 times rho mean at z=0
#For a 10^12 Msun/h halo, the radius in Mpc/h where the contained density equals rho_crit*200
rad_crit200=(1e12/rho_crit200*3/4/pi)^(1/3)
coshaloMvirToRvir(1e12,Lunit=1e6)-rad_crit200 # ~0 as expected
#For a 10^12 Msun/h halo, the radius in Mpc/h where the contained density equals rho_crit*200
rad_mean200=(1e12/rho_mean200*3/4/pi)^(1/3) # ~0 as expected
coshaloMvirToRvir(1e12,Lunit=1e6,Rho='mean')-rad_mean200



