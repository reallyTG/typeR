library(astrolibR)


### Name: planck
### Title: Calculate the Planck function in units of ergs/cm2/s/A
### Aliases: planck
### Keywords: misc

### ** Examples

#   Calculate the blackbody flux at 30,000 K every 100 Angstroms between 2000A and 4000A

wave = 2000 + seq(0,2000,by=100)
plot(wave, planck(wave,30000), lty=1, lwd=2)



