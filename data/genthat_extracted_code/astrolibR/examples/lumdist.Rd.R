library(astrolibR)


### Name: lumdist
### Title: Calculate luminosity distance (in Mpc) of an object given its
###   redshift
### Aliases: lumdist
### Keywords: misc

### ** Examples

# Plot the distance of a galaxy in Mpc as a function of redshift out 
#  to z = 5.0, assuming the default cosmology (Omega_m=0.3, Lambda = 0.7,
#  H0 = 70 km/s/Mpc)

z <- seq(0,5,length=51)
plot(z, lumdist(z), type='l', lwd=2, xlab='z', ylab='Distance (Mpc)') 

# Now overplot the relation for zero cosmological constant and 
# Omega_m=0.3

lines(z,lumdist(z, lambda=0, omega_m=0.3), lty=2, lwd=2)



