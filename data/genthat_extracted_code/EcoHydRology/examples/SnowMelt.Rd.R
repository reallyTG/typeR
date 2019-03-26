library(EcoHydRology)


### Name: SnowMelt
### Title: Snow Melt Calculator
### Aliases: SnowMelt

### ** Examples

##  
data(OwascoInlet)
sm <- SnowMelt(Date=OwascoInlet$date, precip_mm=OwascoInlet$P_mm,
 Tmax_C=OwascoInlet$Tmax_C, Tmin_C=OwascoInlet$Tmin_C, lat_deg=42)
summary(sm)



