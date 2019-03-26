library(celestial)


### Name: cosdist
### Title: Cosmological distance calculations
### Aliases: cosdist cosdistz cosdista cosdistCoDist cosdistLumDist
###   cosdistAngDist cosdistAngDist12 cosdistCoDistTran cosdistCoDist12ang
###   cosdistDistMod cosdistAngScale cosdistAngSize cosdistAngArea
###   cosdistCoVol cosdistHubTime cosdistUniAgeNow cosdistUniAgeAtz
###   cosdistTravelTime cosdistRelError cosdistCrit cosdistCoDist12ang
###   cosdistLumDist12ang cosdistAngDist12ang cosdistzem12ang
###   cosdistzeff12ang cosdistzeff
### Keywords: cosmo cosmology distance

### ** Examples

## Not run: 
##D cosdist(0.3,70,age=TRUE)
##D cosdist(0.3,70,age=TRUE,ref='Planck')
##D cosdistz(0.3)
##D cosdista(0.3)
##D cosdistCoDist(0.3,70)
##D cosdistLumDist(0.3,70)
##D cosdistAngDist(0.3,70)
##D cosdistAngDist12(0.3,0.5,70)
##D cosdistCoDistTran(0.3,70)
##D cosdistCoDist12ang(0,2,10)
##D cosdistDistMod(0.3,70)
##D cosdistAngScale(0.3,70)
##D cosdistAngSize(0.3,1,70)
##D cosdistCoVol(0.3,70)
##D cosdistHubTime(70)
##D cosdistUniAgeNow(0.3,70)
##D cosdistUniAgeAtz(0.3,70)
##D cosdistTravelTime(0.3,70)
##D cosdistRelError(0.3)
##D cosdistCrit(0.3,0.5,70)
##D cosdistzeff(1,2)
##D cosdistzem12ang(1,2)
##D cosdistzeff12ang(1,2)
##D 
##D #A check of the comoving separation between objects function:
##D 
##D cosdistCoDistTran(2,OmegaM = 0.3, OmegaL=1)*sin(pi/180)
##D cosdistCoDist12ang(2,2,ang=1,OmegaM=0.3,OmegaL=1)
##D 
##D #Very close, however cosdistCoDist12ang lets us go further:
##D 
##D cosdistCoDist12ang(1,2,ang=10,OmegaM=0.3,OmegaL=1)
##D cosdistCoDist12ang(2,2,ang=180,OmegaM=0.3,OmegaL=1)
##D 
##D #The second number should be be the same as:
##D 
##D cosdistCoDist(2,OmegaM=0.3,OmegaL=1)*2
##D 
##D #Example 1 by John Peacock for EDS Universe (answer should be nearly 3):
##D 
##D cosdistzem12ang(3,4,56.4,H0=100,OmegaM=1,OmegaL=0)
##D 
##D #Example 2 by John Peacock for EDS Universe (answer should be nearly 2995 Mpc/h):
##D 
##D cosdistCoDist12ang(3,4,56.4,H0=100,OmegaM=1,OmegaL=0)
##D 
##D #Example 3 by John Peacock for Milne Universe (answer should be nearly 5294 Mpc/h):
##D 
##D cosdistCoDist12ang(3,4,56,H0=100,OmegaM=0,OmegaL=0)
##D 
##D #Example 4 by John Peacock for Milne Universe (answer should be nearly 4.846):
##D 
##D cosdistzeff12ang(3,4,56,H0=100,OmegaM=0,OmegaL=0)
##D 
##D #Example 5 by John Peacock for Milne Universe (answer should be nearly 364 Mpc/h):
##D 
##D cosdistAngDist12ang(3,4,56,H0=100,OmegaM=0,OmegaL=0)
##D 
##D #Nice plot of distance estimates:
##D 
##D redshifts=seq(0,3,by=0.01)
##D plot(redshifts, cosdistCoDist(redshifts, ref='planck'), type='l', col='darkgreen',
##D xlab='Redshift / z', ylab='Distance / Mpc')
##D lines(redshifts, cosdistLumDist(redshifts, ref='planck'), col='red')
##D lines(redshifts, cosdistAngDist(redshifts, ref='planck'), col='blue')
##D legend('topleft', legend=c('Comoving Distance', 'Luminosity Distance', 'Angular Diameter Distance'),
##D col=c('darkgreen', 'red', 'blue'),lty=1)
##D 
##D plot(redshifts, cosdistTravelTime(redshifts, ref='planck'), type='l',
##D xlab='Redshift / z', ylab='Light travel time / Yrs')
##D 
##D #Actual time example (Figure 1 of Davis & Lineweaver 2004)
##D zseq=10^seq(-2,6,len=1e3)-1
##D dists=cosdistCoDist(zseq, ref='737')*0.00326
##D times=cosdistTravelTime(zseq, ref='737')
##D plot(dists, times, type='l', xlab='Comoving Distance / Glyr',
##D ylab='Time / Gyr')
##D abline(v=0, h=0, lty=1)
##D abline(h=c(min(times), max(times)), lty=2)
##D abline(v=c(min(dists), max(dists)), lty=2)
##D 
##D #Conformal time example (Figure 1 of Davis & Lineweaver 2004):
##D #Mpc to Glyr conversion is 0.00326
##D 
##D zseq=10^seq(-2,6,len=1e3)-1
##D dists=cosdistCoDist(zseq, ref='737')*0.00326
##D plot(dists, dists, type='l',
##D xlab='Comoving Distance / Glyr', ylab='Conformal Time / Gyr')
##D abline(v=0, h=0, lty=1)
##D abline(h=c(min(dists), max(dists)), lty=2)
##D abline(v=c(min(dists), max(dists)), lty=2)
## End(Not run)



