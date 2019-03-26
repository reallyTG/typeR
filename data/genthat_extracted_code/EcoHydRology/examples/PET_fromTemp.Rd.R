library(EcoHydRology)


### Name: PET_fromTemp
### Title: Priestley-Taylor Potential Evapotranspiration from temperature
### Aliases: PET_fromTemp

### ** Examples

data(OwascoInlet)
head(OwascoInlet)
attach(OwascoInlet)
PETapprox <- PET_fromTemp(Jday=(1+as.POSIXlt(date)$yday), Tmax_C=Tmax_C,
 Tmin_C=Tmin_C, lat_radians=42.45*pi/180)
plot(PETapprox*1000~date, type="l")
detach(OwascoInlet)




