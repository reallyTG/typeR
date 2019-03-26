library(LakeMetabolizer)


### Name: k.read.base
### Title: Returns a timeseries of gas exchange velocity
### Aliases: k.cole.base k.crusius.base k.heiskanen.base k.macIntyre.base
###   k.read.base k.read.soloviev.base k.vachon.base
### Keywords: math methods

### ** Examples

wnd.z <- 2
Kd <- 2
lat <- 54
lake.area <- 5000 
atm.press <- 1013
dateTime <- as.POSIXct("2013-12-30 14:00")
Ts <- 16.5
z.aml <- 2.32
airT <- 20
wnd <- 6
RH <- 90
sw <- 800
lwnet <- -55
timeStep <- 30

U10 <- wind.scale.base(wnd, wnd.z)

k600_cole <- k.cole.base(U10)

k600_crusius <- k.crusius.base(U10)

k600_read <- k.read.base(wnd.z, Kd, lat, lake.area, atm.press, 
dateTime, Ts, z.aml, airT, wnd, RH, sw, lwnet)

k600_soloviev <- k.read.soloviev.base(wnd.z, Kd, lat, lake.area, 
atm.press, dateTime, Ts, z.aml, airT, wnd, RH, sw, lwnet)

k600_macInytre <- k.macIntyre.base(wnd.z, Kd, atm.press, 
dateTime, Ts, z.aml, airT, wnd, RH, sw, lwnet)




