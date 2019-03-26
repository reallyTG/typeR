library(celestial)


### Name: cosgrow
### Title: Cosmological growth and evolution calculations
### Aliases: cosgrow cosgrowz cosgrowa cosgrowOmegaM cosgrowOmegaL
###   cosgrowOmegaR cosgrowOmegaK cosgrowDecelq cosgrowH cosgrowCoVel
###   cosgrowPecVel cosgrowFactor cosgrowRate cosgrowSigma8
###   cosgrowFactorApprox cosgrowRateApprox cosgrowSigma8Approx
###   cosgrowRhoCrit cosgrowRhoMean cosgrowEoSwDE cosgrowRhoDE
###   cosgrowDeltaVir
### Keywords: cosmo cosmology growth

### ** Examples

  cosgrow(0.3)
  cosgrow(0.3,ref='Planck')
  cosgrowz(0.3)
  cosgrowa(0.3)
  cosgrowH(0.3)
  cosgrowCoVel(0.3)
  cosgrowPecVel(0.3,0.31)
  cosgrowOmegaM(0.3)
  cosgrowOmegaL(0.3)
  cosgrowOmegaK(0.3)
  sum(cosgrowOmegaM(0.3)+cosgrowOmegaL(0.3)+cosgrowOmegaK(0.3)) #Still 1.
  cosgrowDecelq(0.3)
  cosgrowEoSwDE(0.3)
  cosgrowFactor(0.3)
  cosgrowFactorApprox(0.3) #Approximation better than 1% for reasonable cosmologies.
  cosgrowRate(0.3)
  cosgrowRateApprox(0.3) #Approximation better than 1% for reasonable cosmologies.
  cosgrowRhoCrit(0.3)
  cosgrowRhoMean(0.3)
  cosgrowRhoMean(0)-cosgrowRhoMean(2,Dist='Ang')/(1+2)^3 #Mass is conserved in co-vol
  cosgrowRhoMean(0)-cosgrowRhoMean(10,Dist='Co') #Mass is conserved in co-vol
  
  # Various recessional velocities (see Figure 2 of Davis & Lineweaver 2004):
  
  plot(10^seq(-1,4,by=0.01), cosgrowCoVel(10^seq(-1,4,by=0.01), ref='planck')
  /299792.458, type='l', log='x', xlab='z', ylab='Cosmological Recession Velocity / c')
  lines(10^seq(-1,4,by=0.01), cosgrowPecVel(0,10^seq(-1,4,by=0.01))/299792.458, col='red')
  lines(10^seq(-1,4,by=0.01), 10^seq(-1,4,by=0.01), col='blue')
  abline(h=1,v=1.5,lty=2)
  legend('topleft', legend=c('GR', 'SR', 'Approx (cz)', 'Superluminal'), lty=c(1,1,1,2),
  col=c('black','red','blue','black'))
  
  # Comparison of the various energy densities that make up the Universe for Planck 2013:
  
  plot(cosdistUniAgeAtz(10^seq(-3,4.9,by=0.1), ref='Planck')*1e9,
  cosgrowRhoCrit(10^seq(-3,4.9,by=0.1), ref='Planck', Dist='m', Mass='kg')*
  cosgrowOmegaR(10^seq(-3,4.9,by=0.1), ref='Planck'), type='l',log='xy',
  xlab='Years since Universe formed', ylab=expression('Energy Density'*(kg/m^3)))
  
  lines(cosdistUniAgeAtz(10^seq(-3,4.9,by=0.1), ref='Planck')*1e9,
  cosgrowRhoCrit(10^seq(-3,4.9,by=0.1), ref='Planck', Dist='m', Mass='kg')*
  cosgrowOmegaM(10^seq(-3,4.9,by=0.1), ref='Planck'), col='red')
  
  lines(cosdistUniAgeAtz(10^seq(-3,4.9,by=0.1), ref='Planck')*1e9,
  cosgrowRhoCrit(10^seq(-3,4.9,by=0.1), ref='Planck', Dist='m', Mass='kg')*
  cosgrowOmegaL(10^seq(-3,4.9,by=0.1), ref='Planck'), col='blue')

  abline(v=cosdistUniAgeAtz(0.33,ref='Planck')*1e9,lty=2) # Matter = Vacuum
  abline(v=cosdistUniAgeAtz(3391,ref='Planck')*1e9,lty=2) # Matter = Radiation
  
  legend('topright', legend=c('Radiation Energy Density', 'Matter Energy Density',
  'Vacuum Energy Density'), lty=1, col=c('black','red','blue'))
  
  # Where's the acceleration?
  plot(seq(0,2,len=1e3),cosgrowH(seq(0,2,len=1e3)),type='l',xlab='z',
  ylab='H(z) / km/s / pMpc')
  # There it is!
  plot(seq(0,2,len=1e3),cosgrowH(seq(0,2,len=1e3))/(1+seq(0,2,len=1e3)),
  type='l',xlab='z',ylab='H(z) / km/s / cMpc')
  #When does it start accelerating?
  accel.loc=which.min(abs(cosgrowDecelq(seq(0,2,len=1e3))))
  abline(v=seq(0,2,len=1e3)[accel.loc],lty=2)



