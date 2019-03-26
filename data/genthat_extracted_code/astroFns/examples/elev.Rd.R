library(astroFns)


### Name: elev
### Title: Source elevation
### Aliases: elev azimuth
### Keywords: misc

### ** Examples

# Maximum elevation at Green Bank
elev(dms2rad('-28, 20'))

# Maximum elevation at Mauna Kea
elev(dms2rad('-28, 20'), 0, '19:49')

# Plot elevation and azimugh vs. hour angle
ha <- seq(0, 24, 0.25)
el <- elev('30d 33m 22s', ha)
plot(ha, el, t='l', col=4)
az <- azimuth('30d 33m 22s', ha)
plot(ha, az, t='l', col=4)

# Plot elevation and azimuth vs. UT (using many defaults)
h.ut <-  seq(0, 24, 0.25)
el <- elev(dec.sou='30d 33m 22s', ha=ut2ha(hr=h.ut))
plot(h.ut, el, t='l', col=4)
az <- azimuth(dec.sou='30d 33m 22s', ha=ut2ha(hr=h.ut))
plot(h.ut, az, t='l', col=4)





