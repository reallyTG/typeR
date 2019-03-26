library(celestial)


### Name: planck
### Title: Planck's Law and Related Functions
### Aliases: planck cosplanck cosplanckLawRadFreq cosplanckLawRadWave
###   cosplanckLawEnFreq cosplanckLawEnWave cosplanckLawRadFreqN
###   cosplanckLawRadWaveN cosplanckPeakFreq cosplanckPeakWave
###   cosplanckSBLawRad cosplanckSBLawRad_sr cosplanckSBLawEn
###   cosplanckLawRadPhotEnAv cosplanckLawRadPhotN cosplanckCMBTemp
### Keywords: planck blackbody

### ** Examples

#Classic example for different temperature stars:

waveseq=10^seq(-7,-5,by=0.01)
plot(waveseq, cosplanckLawRadWave(waveseq,5000),
log='x', type='l', xlab=expression(Wavelength / m),
ylab=expression('Spectral Radiance' / W*sr^{-1}*m^{-2}*m^{-1}), col='blue')
lines(waveseq, cosplanckLawRadWave(waveseq,4000), col='green')
lines(waveseq, cosplanckLawRadWave(waveseq,3000), col='red')
legend('topright', legend=c('3000K','4000K','5000K'), col=c('red','green','blue'), lty=1)

#CMB now:

plot(10^seq(9,12,by=0.01), cosplanckLawRadFreq(10^seq(9,12,by=0.01)),
log='x', type='l', xlab=expression(Frequency / Hz),
ylab=expression('Spectral Radiance' / W*sr^{-1}*m^{-2}*Hz^{-1}))
abline(v=cosplanckPeakFreq(),lty=2)

plot(10^seq(-4,-1,by=0.01), cosplanckLawRadWave(10^seq(-4,-1,by=0.01)),
log='x', type='l', xlab=expression(Wavelength / m),
ylab=expression('Spectral Radiance' / W*sr^{-1}*m^{-2}*m^{-1}))
abline(v=cosplanckPeakWave(),lty=2)

#CMB at surface of last scattering:

TempLastScat=cosplanckCMBTemp(1100) #Note this is still much cooler than our Sun!

plot(10^seq(12,15,by=0.01), cosplanckLawRadFreq(10^seq(12,15,by=0.01),TempLastScat),
log='x', type='l', xlab=expression(Frequency / Hz),
ylab=expression('Spectral Radiance' / W*sr^{-1}*m^{-2}*Hz^{-1}))
abline(v=cosplanckPeakFreq(TempLastScat),lty=2)

plot(10^seq(-7,-4,by=0.01), cosplanckLawRadWave(10^seq(-7,-4,by=0.01),TempLastScat),
log='x', type='l', xlab=expression(Wavelength / m),
ylab=expression('Spectral Radiance' / W*sr^{-1}*m^{-2}*m^{-1}))
abline(v=cosplanckPeakWave(TempLastScat),lty=2)

#Exact number of photons produced by black body:

cosplanckLawRadPhotN()

#We can get pretty much the correct answer through direct integration, i.e.:

integrate(cosplanckLawRadFreqN,1e8,1e12)
integrate(cosplanckLawRadWaveN,1e-4,1e-1)

#Stefan-Boltzmann Law:

cosplanckSBLawRad_sr()

#We can get (almost, some rounding is off) the same answer by multiplying
#the total number of photons produced by a black body per metre squared per
#second per steradian by the average photon energy:

cosplanckLawRadPhotEnAv()*cosplanckLawRadPhotN()




