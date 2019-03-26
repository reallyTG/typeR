library(celestial)


### Name: cosNFW
### Title: Navarro Frenk and White profile
### Aliases: cosNFW cosNFWmass_c cosNFWmass_Rmax cosNFWvcirc cosNFWvesc
###   cosNFWsigma cosNFWsigma_mean cosNFWgamma cosNFWduffym2c
### Keywords: halo NFW cosmo cosmology

### ** Examples

#What difference do we see if we use the rad_mean200 radius rather than rad_crit200

rad_crit200=coshaloMvirToRvir(1e12,Lunit=1e6)
rad_mean200=coshaloMvirToRvir(1e12,Lunit=1e6,Rho='mean')
cosNFWmass_Rmax(Rmax=rad_crit200) #By construction we should get ~10^12 Msun/h
cosNFWmass_Rmax(Rmax=rad_mean200) #For the same profile this is a factor 1.31 larger

#Shear checks:

plot(10^seq(-2,2,by=0.1), cosNFWgamma(10^seq(-2,2,by=0.1),Rs=0.2,c=10), type='l',
log='xy', xlab='R/Rs', ylab='ESD')
legend('topright', legend=c('Rs=0.2','c=10'))

#How do critical, mean 200 and 500 masses evolve with redshift? Let's see:

zseq=10^seq(-2, 1, by=0.1)
con=seq(2, 20, by=0.01)
concol=rainbow(length(con), start=0, end=5/6)
rad_crit200=coshaloMvirToRvir(1, z=zseq, Rho='crit', DeltaVir=200, ref='Planck15')
rad_crit500=coshaloMvirToRvir(1, z=zseq, Rho='crit', DeltaVir=500, ref='Planck15')
rad_mean200=coshaloMvirToRvir(1, z=zseq, Rho='mean', DeltaVir=200, ref='Planck15')
rad_mean500=coshaloMvirToRvir(1, z=zseq, Rho='mean', DeltaVir=500, ref='Planck15')
rad_vir=coshaloMvirToRvir(1, z=zseq, Rho='crit', DeltaVir='get', ref='Planck15')

plot(1, 1, type='n', xlim=c(0.01,10), ylim=c(0.8,1.55), xlab='Redshift',
ylab='M200c / M500c', log='x')
for(i in 1:length(con)){
lines(zseq, cosNFWmass_Rmax(Rho0=1, Rs=rad_crit200[1]/con[i], Rmax=rad_crit200)/
cosNFWmass_Rmax(Rho0=1, Rs=rad_crit200[1]/con[i], Rmax=rad_crit500), col=concol[i])
}

plot(1, 1, type='n', xlim=c(0.01,10), ylim=c(0.8,1.55), xlab='Redshift',
ylab='M200m / M500m', log='x')
for(i in 1:length(con)){
lines(zseq, cosNFWmass_Rmax(Rho0=1, Rs=rad_crit200[1]/con[i], Rmax=rad_mean200)/
cosNFWmass_Rmax(Rho0=1, Rs=rad_crit200[1]/con[i], Rmax=rad_mean500), col=concol[i])
}

plot(1, 1, type='n', xlim=c(0.01,10), ylim=c(0.8,1.55), xlab='Redshift',
ylab='M200m / M200c',log='x')
for(i in 1:length(con)){
lines(zseq, cosNFWmass_Rmax(Rho0=1, Rs=rad_crit200[1]/con[i], Rmax=rad_mean200)/
cosNFWmass_Rmax(Rho0=1, Rs=rad_crit200[1]/con[i], Rmax=rad_crit200), col=concol[i])
}

plot(1, 1, type='n', xlim=c(0.01,10), ylim=c(0.8,1.55), xlab='Redshift',
ylab='M500m / M500c', log='x')
for(i in 1:length(con)){
lines(zseq, cosNFWmass_Rmax(Rho0=1, Rs=rad_crit200[1]/con[i], Rmax=rad_mean500)/
cosNFWmass_Rmax(Rho0=1, Rs=rad_crit200[1]/con[i], Rmax=rad_crit500), col=concol[i])
}

plot(1, 1, type='n', xlim=c(0.01,10), ylim=c(0.8,1.55), xlab='Redshift',
ylab='Mvir / M200c',log='x')
for(i in 1:length(con)){
lines(zseq, cosNFWmass_Rmax(Rho0=1, Rs=rad_crit200[1]/con[i], Rmax=rad_vir)/
cosNFWmass_Rmax(Rho0=1, Rs=rad_crit200[1]/con[i], Rmax=rad_crit200), col=concol[i])
}

plot(1, 1, type='n', xlim=c(0.01,10), ylim=c(0.8,1.55), xlab='Redshift',
ylab='Mvir / M200m',log='x')
for(i in 1:length(con)){
lines(zseq, cosNFWmass_Rmax(Rho0=1, Rs=rad_crit200[1]/con[i], Rmax=rad_vir)/
cosNFWmass_Rmax(Rho0=1, Rs=rad_crit200[1]/con[i], Rmax=rad_mean200), col=concol[i])
}

plot(zseq, rad_crit200/rad_crit500, type='l', xlim=c(0.01,10), ylim=c(0.8,1.55),
xlab='Redshift', ylab='R200 / R500', log='x')

plot(zseq, rad_mean200/rad_crit200, type='l', xlim=c(0.01,10), ylim=c(0.8,1.55), 
xlab='Redshift', ylab='Rm / Rc', log='x')

plot(zseq, rad_vir/rad_crit200, type='l', xlim=c(0.01,10), ylim=c(0.8,1.55), 
xlab='Redshift', ylab='Rvir / R200c', log='x')

plot(zseq, rad_vir/rad_mean200, type='l', xlim=c(0.01,10), ylim=c(0.8,1.55), 
xlab='Redshift', ylab='Rvir / R200c', log='x')

#R200m and R200c go either side of Rvir, so by cosmic conspiracy the mean is nearly flat:

plot(zseq, 2*rad_vir/(rad_mean200+rad_crit200), type='l', xlim=c(0.01,10),
ylim=c(0.8,1.55), xlab='Redshift', ylab='2Rvir / (R200c+R200m)', log='x')

#To check Vcirc and Vesc for a 10^12 Msun halo:

plot(0:400, cosNFWvcirc(0:400,f=1,Lunit=1e3), type='l', lty=1, xlab='R / kpc',
ylab='V / km/s', ylim=c(0,500))
lines(0:400, cosNFWvesc(0:400,f=1,Lunit=1e3), lty=2)
legend('topright', legend=c('Vel-Circ','Vel-Escape'), lty=c(1,2))
abline(v=coshaloMvirToRvir(Lunit=1e3), lty=3)




