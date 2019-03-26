library(astrolibR)


### Name: zang
### Title: Determine the angular size of an object as a function of
###   redshift
### Aliases: zang
### Keywords: misc

### ** Examples

# What would be the angular size of galaxy of diameter 50 kpc at a redshift
#      of 1.5 in an open universe with Lambda = 0 and Omega (matter) = 0.3.
#      Assume the default Hubble constant value of 70 km/s/Mpc.
# Result: 6.58 arc seconds
      
zang(50, 1.5, lambda = 0, omega_m = 0.3)

# Plot the angular size of a 50 kpc diameter galaxy as a function of 
#      redshift for the default cosmology (Lambda = 0.7, Omega_m=0.3) up to 
#      z = 0.5

# zseq = seq(0.01,0.5,length=50)
# plot(zseq, zang(50.0,zseq),xlab='z',ylab='Angular Size (arcsec)')



