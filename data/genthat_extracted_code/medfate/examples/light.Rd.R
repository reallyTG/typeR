library(medfate)


### Name: light
### Title: Light extinction and absortion functions
### Aliases: light.layerSunlitFraction light.layerIrradianceFraction
###   light.layerIrradianceFractionBottomUp
###   light.cohortSunlitShadeAbsorbedRadiation
###   light.instantaneousLightExtinctionAbsortion

### ** Examples

LAI = 2
nlayer = 10
LAIlayerlive = matrix(rep(LAI/nlayer,nlayer),nlayer,1)
LAIlayerdead = matrix(0,nlayer,1)
kb = 0.8
kd_PAR = 0.5
kd_SWR = kd_PAR/1.35
alpha_PAR = 0.9
gamma_PAR = 0.04
gamma_SWR = 0.05
alpha_SWR = 0.7

Ibfpar = light.layerIrradianceFraction(LAIlayerlive,LAIlayerdead,LAIlayerlive,kb, alpha_PAR)
Idfpar = light.layerIrradianceFraction(LAIlayerlive,LAIlayerdead,LAIlayerlive,kd_PAR, alpha_PAR)
Ibfswr = light.layerIrradianceFraction(LAIlayerlive,LAIlayerdead,LAIlayerlive,kb, alpha_SWR)
Idfswr = light.layerIrradianceFraction(LAIlayerlive,LAIlayerdead,LAIlayerlive,kd_SWR, alpha_SWR)
fsunlit = light.layerSunlitFraction(LAIlayerlive, LAIlayerdead, kb)
SHarea = (1-fsunlit)*LAIlayerlive[,1] 
SLarea = fsunlit*LAIlayerlive[,1] 

par(mar=c(4,4,1,1), mfrow=c(1,2))
plot(Ibfpar*100, 1:nlayer,type="l", ylab="Layer", 
     xlab="Percentage of irradiance", xlim=c(0,100), ylim=c(1,nlayer), col="dark green")
lines(Idfpar*100, 1:nlayer, col="dark green", lty=2)
lines(Ibfswr*100, 1:nlayer, col="red")
lines(Idfswr*100, 1:nlayer, col="red", lty=2)

plot(fsunlit*100, 1:nlayer,type="l", ylab="Layer", 
     xlab="Percentage of leaves", xlim=c(0,100), ylim=c(1,nlayer))
lines((1-fsunlit)*100, 1:nlayer, lty=2)


solarElevation = 0.67
SWR_direct = 1100
SWR_diffuse = 300
PAR_direct = 550
PAR_diffuse = 150


abs_PAR = light.cohortSunlitShadeAbsorbedRadiation(PAR_direct, PAR_diffuse,
                        Ibfpar, Idfpar, beta = solarElevation, 
                        LAIlayerlive, LAIlayerdead, kb, kd_PAR, alpha_PAR, gamma_PAR)
abs_SWR = light.cohortSunlitShadeAbsorbedRadiation(SWR_direct, SWR_diffuse,
                        Ibfswr, Idfswr, beta = solarElevation, 
                        LAIlayerlive, LAIlayerdead, kb, kd_SWR, alpha_SWR, gamma_SWR)
par(mar=c(4,4,1,1), mfrow=c(1,2))
absRadSL = abs_SWR$I_sunlit[,1]
absRadSH = abs_SWR$I_shade[,1]
lambda = 546.6507
QSL = abs_PAR$I_sunlit[,1]*lambda*0.836*0.01
QSH = abs_PAR$I_shade[,1]*lambda*0.836*0.01
plot(QSL, 1:nlayer,type="l", ylab="Layer", 
     xlab="Absorbed PAR quantum flux per leaf area", ylim=c(1,nlayer), col="dark green", 
     xlim=c(0,max(QSL)))
lines(QSH, 1:nlayer, col="dark green", lty=2)
plot(absRadSL, 1:nlayer,type="l", ylab="Layer", 
     xlab="Absorbed SWR per leaf area (W/m2)", ylim=c(1,nlayer), col="red", 
     xlim=c(0,max(absRadSL)))
lines(absRadSH, 1:nlayer, col="red", lty=2)




