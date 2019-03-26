### R code from vignette source 'Meteorology.Rnw'
### Encoding: ISO8859-1

###################################################
### code chunk number 1: Meteorology.Rnw:12-14
###################################################
options(width=67)
library(meteoland)


###################################################
### code chunk number 2: Meteorology.Rnw:68-69
###################################################
showClass("SpatialPointsTopography")


###################################################
### code chunk number 3: Meteorology.Rnw:73-74
###################################################
showClass("SpatialGridTopography")


###################################################
### code chunk number 4: Meteorology.Rnw:78-79
###################################################
showClass("SpatialPixelsTopography")


###################################################
### code chunk number 5: Meteorology.Rnw:90-91
###################################################
showClass("SpatialPointsMeteorology")


###################################################
### code chunk number 6: Meteorology.Rnw:95-96
###################################################
showClass("SpatialGridMeteorology")


###################################################
### code chunk number 7: Meteorology.Rnw:100-101
###################################################
showClass("SpatialPixelsMeteorology")


###################################################
### code chunk number 8: Meteorology.Rnw:166-167
###################################################
showClass("MeteorologyInterpolationData")


###################################################
### code chunk number 9: Meteorology.Rnw:175-176
###################################################
showClass("MeteorologyUncorrectedData")


###################################################
### code chunk number 10: Meteorology.Rnw:198-207
###################################################
r = 0:1000
R_p = 500
gf1 = exp(-3.0*((r/R_p)^2.0)) - exp(-3.0)
gf2 = exp(-6.25*((r/R_p)^2.0)) - exp(-6.25)
gf1[r>R_p] = 0
gf2[r>R_p] = 0
plot(r, gf1, type="l", ylab = "W(r)", xlab ="r")
lines(r, gf2, lty=2)
legend("topright", legend = c("alpha = 3", "alpha = 6.25"), lty=c(1,2), bty="n")


###################################################
### code chunk number 11: Meteorology.Rnw:336-338
###################################################
options(width=67)
library(meteoland)


###################################################
### code chunk number 12: Meteorology.Rnw:347-379
###################################################
par(mar=c(3,4,1,3), mfrow=c(1,2))
dates = seq(as.Date("2012-01-01"), as.Date("2012-12-31"), by="day")[1:365]
J = radiation_julianDay(2012,1,1)+0:364
delta = unlist(lapply(J,radiation_solarDeclination))
plot(dates,delta, type="l", xlab="", ylab="Declination (radians)", cex=0.8, lwd=1.5)
J2 = radiation_julianDay(1012,1,1)+0:364
delta2 = unlist(lapply(J2,radiation_solarDeclination))
lines(dates, delta2, col="red", lty=2)
J3 = radiation_julianDay(12,1,1)+0:364
delta2 = unlist(lapply(J3,radiation_solarDeclination))
lines(dates, delta2, col="blue", lty=3)
J4 = radiation_julianDay(3012,1,1)+0:364
delta2 = unlist(lapply(J4,radiation_solarDeclination))
lines(dates, delta2, col="brown", lty=4)
legend("bottom", legend = paste0(c(3012,2012,1012,12), " AD"), col=c("brown","black","red","blue"), cex=0.8, lty=c(4,1,2,3), lwd=c(1,1.5,1,1), bty="n")
axis(4, at=seq(-0.4, 0.4, by=0.2), labels=round(seq(-0.4, 0.4, by=0.2)*180/pi))
mtext("Declination (degrees)", side=4, line=2)

dates = seq(as.Date("2012-01-01"), as.Date("2012-12-31"), by="day")[1:365]
J = radiation_julianDay(2012,1,1)+0:364
sc = unlist(lapply(J,radiation_solarConstant))
plot(dates,sc, type="l", xlab="", ylab="Solar constant (kw/m2)", cex=0.8, lwd=1.5)
J2 = radiation_julianDay(1012,1,1)+0:364
sc2 = unlist(lapply(J2,radiation_solarConstant))
lines(dates, sc2, col="red", lty=2)
J3 = radiation_julianDay(12,1,1)+0:364
sc2 = unlist(lapply(J3,radiation_solarConstant))
lines(dates, sc2, col="blue", lty=3)
J4 = radiation_julianDay(3012,1,1)+0:364
sc2 = unlist(lapply(J4,radiation_solarConstant))
lines(dates, sc2, col="brown", lty=4)
legend("top", legend = paste0(c(3012,2012,1012,12), " AD"), col=c("brown","black","red","blue"), cex=0.8, lty=c(4,1,2,3), lwd=c(1,1.5,1,1), bty="n")


###################################################
### code chunk number 13: Meteorology.Rnw:391-427
###################################################
par(mfrow=c(1,3))
latrad1 = 40*(pi/180)
latrad2 = 0
latrad3 = -40*(pi/180)
dll1 = rep(NA, length(delta))
dll2 = rep(NA, length(delta))
dll3 = rep(NA, length(delta))
srl1 = rep(NA, length(delta))
srl2 = rep(NA, length(delta))
srl3 = rep(NA, length(delta))
ssl1 = rep(NA, length(delta))
ssl2 = rep(NA, length(delta))
ssl3 = rep(NA, length(delta))
for(i in 1:length(delta)) {
  dll1[i]=radiation_daylength(latrad1, 0, 0, delta[i])
  dll2[i]=radiation_daylength(latrad2, 0, 0, delta[i])
  dll3[i]=radiation_daylength(latrad3, 0, 0, delta[i])
  srl1[i]=radiation_sunRiseSet(latrad1, 0, 0, delta[i])[1]*12.0/pi
  srl2[i]=radiation_sunRiseSet(latrad2, 0, 0, delta[i])[1]*12.0/pi
  srl3[i]=radiation_sunRiseSet(latrad3, 0, 0, delta[i])[1]*12.0/pi
  ssl1[i]=radiation_sunRiseSet(latrad1, 0, 0, delta[i])[2]*12.0/pi
  ssl2[i]=radiation_sunRiseSet(latrad2, 0, 0, delta[i])[2]*12.0/pi
  ssl3[i]=radiation_sunRiseSet(latrad3, 0, 0, delta[i])[2]*12.0/pi
}
plot(dates, srl1, type="l", xlab="", ylab="Sunrise (solar hour)")
lines(dates, srl2, lty=2)
lines(dates, srl3, lty=3)
legend("topright", legend = c("40N","0 (equator)","40S"), cex=0.8, lty=1:3, bty="n")
plot(dates, ssl1, type="l", xlab="", ylab="Sunset (solar hour)")
lines(dates, ssl2, lty=2)
lines(dates, ssl3, lty=3)
legend("topright", legend = c("40N","0 (equator)","40S"), cex=0.8, lty=1:3, bty="n")
plot(dates, dll1, type="l", xlab="", ylab="Hours of sunlight")
lines(dates, dll2, lty=2)
lines(dates, dll3, lty=3)
legend("topright", legend = c("40N","0 (equator)","40S"), cex=0.8, lty=1:3, bty="n")


###################################################
### code chunk number 14: Meteorology.Rnw:458-508
###################################################
par(mfrow=c(1,3))
slorad = 30*(pi/180)
asprad1 = 0
asprad2 = 90*(pi/180)
asprad3 = 180*(pi/180)
asprad4 = 270*(pi/180)
dl1 = rep(NA, length(delta))
dl2 = rep(NA, length(delta))
dl3 = rep(NA, length(delta))
dl4 = rep(NA, length(delta))
sr1 = rep(NA, length(delta))
sr2 = rep(NA, length(delta))
sr3 = rep(NA, length(delta))
sr4 = rep(NA, length(delta))
ss1 = rep(NA, length(delta))
ss2 = rep(NA, length(delta))
ss3 = rep(NA, length(delta))
ss4 = rep(NA, length(delta))
for(i in 1:length(delta)) {
  dl1[i]=radiation_daylength(latrad1, slorad, asprad1, delta[i])
  dl2[i]=radiation_daylength(latrad1, slorad, asprad2, delta[i])
  dl3[i]=radiation_daylength(latrad1, slorad, asprad3, delta[i])
  dl4[i]=radiation_daylength(latrad1, slorad, asprad4, delta[i])
  sr1[i]=radiation_sunRiseSet(latrad1, slorad, asprad1, delta[i])[1]*12.0/pi
  sr2[i]=radiation_sunRiseSet(latrad1, slorad, asprad2, delta[i])[1]*12.0/pi
  sr3[i]=radiation_sunRiseSet(latrad1, slorad, asprad3, delta[i])[1]*12.0/pi
  sr4[i]=radiation_sunRiseSet(latrad1, slorad, asprad4, delta[i])[1]*12.0/pi
  ss1[i]=radiation_sunRiseSet(latrad1, slorad, asprad1, delta[i])[2]*12.0/pi
  ss2[i]=radiation_sunRiseSet(latrad1, slorad, asprad2, delta[i])[2]*12.0/pi
  ss3[i]=radiation_sunRiseSet(latrad1, slorad, asprad3, delta[i])[2]*12.0/pi
  ss4[i]=radiation_sunRiseSet(latrad1, slorad, asprad4, delta[i])[2]*12.0/pi
}
plot(dates, srl1, type="l", xlab="", ylab="Sunrise (solar hour)", ylim=c(-7.5,0))
lines(dates, sr1, lty=1, col="gray")
lines(dates, sr2, lty=2, col="gray")
lines(dates, sr3, lty=3, col="gray")
lines(dates, sr4, lty=4, col="gray")
legend("top",c("flat", "N","E","S","W"), col=c("black",rep("gray",4)), lty=c(1,1:4), bty="n")
plot(dates, ssl1, type="l", xlab="", ylab="Sunset (solar hour)", ylim=c(0,7.5))
lines(dates, ss1, lty=1, col="gray")
lines(dates, ss2, lty=2, col="gray")
lines(dates, ss3, lty=3, col="gray")
lines(dates, ss4, lty=4, col="gray")
legend("bottom",c("flat", "N","E","S","W"), col=c("black",rep("gray",4)), lty=c(1,1:4), bty="n")
plot(dates, dll1, type="l", xlab="", ylab="Hours of direct sunlight", ylim=c(0,15))
lines(dates, dl1, lty=1, col="gray")
lines(dates, dl2, lty=2, col="gray")
lines(dates, dl3, lty=3, col="gray")
lines(dates, dl4, lty=4, col="gray")
legend("bottom",c("flat", "N","E","S","W"), col=c("black",rep("gray",4)), lty=c(1,1:4), bty="n")


###################################################
### code chunk number 15: Meteorology.Rnw:513-546
###################################################
par(mfrow=c(1,3))
for(i in 1:length(delta)) {
  dl1[i]=radiation_daylength(latrad2, slorad, asprad1, delta[i])
  dl2[i]=radiation_daylength(latrad2, slorad, asprad2, delta[i])
  dl3[i]=radiation_daylength(latrad2, slorad, asprad3, delta[i])
  dl4[i]=radiation_daylength(latrad2, slorad, asprad4, delta[i])
  sr1[i]=radiation_sunRiseSet(latrad2, slorad, asprad1, delta[i])[1]*12.0/pi
  sr2[i]=radiation_sunRiseSet(latrad2, slorad, asprad2, delta[i])[1]*12.0/pi
  sr3[i]=radiation_sunRiseSet(latrad2, slorad, asprad3, delta[i])[1]*12.0/pi
  sr4[i]=radiation_sunRiseSet(latrad2, slorad, asprad4, delta[i])[1]*12.0/pi
  ss1[i]=radiation_sunRiseSet(latrad2, slorad, asprad1, delta[i])[2]*12.0/pi
  ss2[i]=radiation_sunRiseSet(latrad2, slorad, asprad2, delta[i])[2]*12.0/pi
  ss3[i]=radiation_sunRiseSet(latrad2, slorad, asprad3, delta[i])[2]*12.0/pi
  ss4[i]=radiation_sunRiseSet(latrad2, slorad, asprad4, delta[i])[2]*12.0/pi
}
plot(dates, srl2, type="l", xlab="", ylab="Sunrise (solar hour)")
lines(dates, sr1, lty=1, col="gray")
lines(dates, sr2, lty=2, col="gray")
lines(dates, sr3, lty=3, col="gray")
lines(dates, sr4, lty=4, col="gray")
legend("bottom",c("flat", "N","E","S","W"), col=c("black",rep("gray",4)), lty=c(1,1:4), bty="n")
plot(dates, ssl2, type="l", xlab="", ylab="Sunset (solar hour)")
lines(dates, ss1, lty=1, col="gray")
lines(dates, ss2, lty=2, col="gray")
lines(dates, ss3, lty=3, col="gray")
lines(dates, ss4, lty=4, col="gray")
legend("top",c("flat", "N","E","S","W"), col=c("black",rep("gray",4)), lty=c(1,1:4), bty="n")
plot(dates, dll2, type="l", xlab="", ylab="Hours of direct sunlight")
lines(dates, dl1, lty=1, col="gray")
lines(dates, dl2, lty=2, col="gray")
lines(dates, dl3, lty=3, col="gray")
lines(dates, dl4, lty=4, col="gray")
legend("top",c("flat", "N","E","S","W"), col=c("black",rep("gray",4)), lty=c(1,1:4), bty="n")


###################################################
### code chunk number 16: Meteorology.Rnw:551-584
###################################################
par(mfrow=c(1,3))
for(i in 1:length(delta)) {
  dl1[i]=radiation_daylength(latrad3, slorad, asprad1, delta[i])
  dl2[i]=radiation_daylength(latrad3, slorad, asprad2, delta[i])
  dl3[i]=radiation_daylength(latrad3, slorad, asprad3, delta[i])
  dl4[i]=radiation_daylength(latrad3, slorad, asprad4, delta[i])
  sr1[i]=radiation_sunRiseSet(latrad3, slorad, asprad1, delta[i])[1]*12.0/pi
  sr2[i]=radiation_sunRiseSet(latrad3, slorad, asprad2, delta[i])[1]*12.0/pi
  sr3[i]=radiation_sunRiseSet(latrad3, slorad, asprad3, delta[i])[1]*12.0/pi
  sr4[i]=radiation_sunRiseSet(latrad3, slorad, asprad4, delta[i])[1]*12.0/pi
  ss1[i]=radiation_sunRiseSet(latrad3, slorad, asprad1, delta[i])[2]*12.0/pi
  ss2[i]=radiation_sunRiseSet(latrad3, slorad, asprad2, delta[i])[2]*12.0/pi
  ss3[i]=radiation_sunRiseSet(latrad3, slorad, asprad3, delta[i])[2]*12.0/pi
  ss4[i]=radiation_sunRiseSet(latrad3, slorad, asprad4, delta[i])[2]*12.0/pi
}
plot(dates, srl3, type="l", xlab="", ylab="Sunrise (solar hour)", ylim=c(-7.5,0))
lines(dates, sr1, lty=1, col="gray")
lines(dates, sr2, lty=2, col="gray")
lines(dates, sr3, lty=3, col="gray")
lines(dates, sr4, lty=4, col="gray")
legend("topright",c("flat", "N","E","S","W"), col=c("black",rep("gray",4)), lty=c(1,1:4), bty="n")
plot(dates, ssl3, type="l", xlab="", ylab="Sunset (solar hour)", ylim=c(0,7.5))
lines(dates, ss1, lty=1, col="gray")
lines(dates, ss2, lty=2, col="gray")
lines(dates, ss3, lty=3, col="gray")
lines(dates, ss4, lty=4, col="gray")
legend("bottomright",c("flat", "N","E","S","W"), col=c("black",rep("gray",4)), lty=c(1,1:4), bty="n")
plot(dates, dll3, type="l", xlab="", ylab="Hours of direct sunlight", ylim=c(0,15))
lines(dates, dl1, lty=1, col="gray")
lines(dates, dl2, lty=2, col="gray")
lines(dates, dl3, lty=3, col="gray")
lines(dates, dl4, lty=4, col="gray")
legend("bottomright",c("flat", "N","E","S","W"), col=c("black",rep("gray",4)), lty=c(1,1:4), bty="n")


###################################################
### code chunk number 17: Meteorology.Rnw:608-663
###################################################
par(mfrow=c(2,2))
inl1 = rep(NA, length(delta))
inl2 = rep(NA, length(delta))
inl3 = rep(NA, length(delta))
for(i in 1:length(delta)) {
  inl1[i]=radiation_potentialRadiation(sc[i],latrad1, 0, 0, delta[i])
  inl2[i]=radiation_potentialRadiation(sc[i],latrad2, 0, 0, delta[i])
  inl3[i]=radiation_potentialRadiation(sc[i],latrad3, 0, 0, delta[i])
}
plot(dates, inl1, type="l", xlab="", ylab="Potential radiation (MJ m-2 d-1)", main="Horizontal surfaces")
lines(dates, inl2, lty=2)
lines(dates, inl3, lty=3)
legend("topright", legend = c("40N","0 (equator)","40S"), cex=0.8, lty=1:3, bty="n")
in1 = rep(NA, length(delta))
in2 = rep(NA, length(delta))
in3 = rep(NA, length(delta))
in4 = rep(NA, length(delta))
for(i in 1:length(delta)) {
  in1[i]=radiation_potentialRadiation(sc[i],latrad1, slorad, asprad1, delta[i])
  in2[i]=radiation_potentialRadiation(sc[i],latrad1, slorad, asprad2, delta[i])
  in3[i]=radiation_potentialRadiation(sc[i],latrad1, slorad, asprad3, delta[i])
  in4[i]=radiation_potentialRadiation(sc[i],latrad1, slorad, asprad4, delta[i])
}
plot(dates, inl1, type="l", xlab="", ylab="Potential radiation (MJ m-2 d-1)",
     main = "Slopes at 40North", ylim=c(0,45))
lines(dates, in1, lty=1, col="gray")
lines(dates, in2, lty=2, col="gray")
lines(dates, in3, lty=3, col="gray")
lines(dates, in4, lty=4, col="gray")
legend("bottom",c("flat", "N","E","S","W"), col=c("black",rep("gray",4)), lty=c(1,1:4), bty="n")
for(i in 1:length(delta)) {
  in1[i]=radiation_potentialRadiation(sc[i],latrad2, slorad, asprad1, delta[i])
  in2[i]=radiation_potentialRadiation(sc[i],latrad2, slorad, asprad2, delta[i])
  in3[i]=radiation_potentialRadiation(sc[i],latrad2, slorad, asprad3, delta[i])
  in4[i]=radiation_potentialRadiation(sc[i],latrad2, slorad, asprad4, delta[i])
}
plot(dates, inl2, type="l", xlab="", main = "Slopes at the Equator", ylab="Potential radiation (MJ m-2 d-1)", ylim=c(0,45))
lines(dates, in1, lty=1, col="gray")
lines(dates, in2, lty=2, col="gray")
lines(dates, in3, lty=3, col="gray")
lines(dates, in4, lty=4, col="gray")
legend("bottom",c("flat", "N","E","S","W"), col=c("black",rep("gray",4)), lty=c(1,1:4), bty="n")
for(i in 1:length(delta)) {
  in1[i]=radiation_potentialRadiation(sc[i],latrad3, slorad, asprad1, delta[i])
  in2[i]=radiation_potentialRadiation(sc[i],latrad3, slorad, asprad2, delta[i])
  in3[i]=radiation_potentialRadiation(sc[i],latrad3, slorad, asprad3, delta[i])
  in4[i]=radiation_potentialRadiation(sc[i],latrad3, slorad, asprad4, delta[i])
}
plot(dates, inl3, type="l", xlab="", ylab="Potential radiation (MJ m-2 d-1)", 
     main = "Slopes at 40South", ylim=c(0,45))
lines(dates, in1, lty=1, col="gray")
lines(dates, in2, lty=2, col="gray")
lines(dates, in3, lty=3, col="gray")
lines(dates, in4, lty=4, col="gray")
legend("bottomright",c("flat", "N","E","S","W"), col=c("black",rep("gray",4)), lty=c(1,1:4), bty="n")


###################################################
### code chunk number 18: Meteorology.Rnw:710-756
###################################################
library(meteoland)
data(examplegridtopography)
data(exampleinterpolationdata)

#Creates spatial topography points from the grid
p = 1:2
points = as(examplegridtopography,"SpatialPoints")[p]
points = spTransform(points, exampleinterpolationdata@proj4string)
spt = SpatialPointsTopography(points, examplegridtopography$elevation[p],
                              examplegridtopography$slope[p],
                              examplegridtopography$aspect[p])

#Interpolation of two points for the whole time period (2000)
mp = interpolationpoints(exampleinterpolationdata, spt, verbose=FALSE)

examplemeteo = mp@data[[1]]
R_s = examplemeteo$Radiation
tmin = examplemeteo$MinTemperature
tmax = examplemeteo$MaxTemperature
rhmin = examplemeteo$MinRelativeHumidity
rhmax = examplemeteo$MaxRelativeHumidity
dates = as.Date(row.names(examplemeteo))
years = as.numeric(format(dates,"%Y"))
months = as.numeric(format(dates,"%m"))
days = as.numeric(format(dates,"%d"))
J =rep(NA, length(years))
for(i in 1:length(years)) {
  J[i] = radiation_julianDay(years[i],months[i],days[i])
  sc[i] = radiation_solarConstant(J[i])
  delta[i] = radiation_solarDeclination(J[i])
}
R_nl = rep(0, length(J))
R_net = rep(0, length(J))
latradp = 42*(pi/180)
elevationp = spt@data$elevation[1] 
sloradp = spt@data$slope[1]*(pi/180)
aspradp = spt@data$aspect[1]*(pi/180)
for(i in 1:length(J)) {
vpa = utils_averageDailyVP(tmin[i], tmax[i], rhmin[i], rhmax[i])
R_nl[i] = radiation_outgoingLongwaveRadiation(sc[i],latradp, elevationp, sloradp,aspradp, delta[i], vpa, tmin[i], tmax[i], R_s[i])
R_net[i] = radiation_netRadiation(sc[i],latradp, elevationp, sloradp,aspradp, delta[i], vpa, tmin[i], tmax[i], R_s[i])
}
plot(dates[1:365], R_s[1:365], type="l", xlab="", ylab = "Daily radiation (MJ m-2)", ylim=c(0,40))
lines(dates[1:365], R_nl[1:365], col="blue")
lines(dates[1:365], R_net[1:365], col="red")
legend("topleft", col=c("black","blue","red"), legend = c("Solar radiation", "Outgoing longwave radiation", "Net shortwave radiation"), bty="n", cex=0.8, lty=1)


###################################################
### code chunk number 19: Meteorology.Rnw:799-818
###################################################
par(mar=c(4,4,1,1), mfrow=c(2,2))
latrad = 0.73
elevation = 100
J = radiation_julianDay(2001,6,1)
gsc = radiation_solarConstant(J)
delta = radiation_solarDeclination(J)
a=radiation_directDiffuseDay(gsc, latrad,delta, 30, TRUE, 100)
se = a$SolarElevation*(180/pi)
se[a$Rpot==0]=NA
plot(a$SolarHour*12/pi, se, type="l", ylim=c(0,70), ylab="Solar elevation (degrees)", xlab="Solar hour")
plot(a$SolarHour*12/pi, a$Rpot, type="l", ylab="Radiation (W m-2)", xlab="Solar hour")
lines(a$SolarHour*12/pi, a$Rg,  lty=2)
legend("topleft", legend=c("Potential", "Global"), lty=c(1,2), bty="n")
plot(a$SolarHour*12/pi, a$SWR_direct, type="l", ylab="SWR radiation (W m-2)", xlab="Solar hour")
lines(a$SolarHour*12/pi, a$SWR_diffuse,  lty=2)
legend("topleft", legend=c("Direct", "Diffuse"), lty=c(1,2), bty="n")
plot(a$SolarHour*12/pi, a$PAR_direct, type="l", ylab="PAR radiation (W m-2)", xlab="Solar hour")
lines(a$SolarHour*12/pi, a$PAR_diffuse,  lty=2)
legend("topleft", legend=c("Direct", "Diffuse"), lty=c(1,2), bty="n")


###################################################
### code chunk number 20: Meteorology.Rnw:822-826
###################################################
data(exampleinterpolationdata)
#Downscaling of future predictions (RCM models, year 2023)
bc_dates = seq(as.Date("2023-01-01"), as.Date("2023-12-31"), by="day")
predicted = correctionpoints(examplecorrectiondata, mp, spt@data, dates = bc_dates, verbose=FALSE)


###################################################
### code chunk number 21: Meteorology.Rnw:858-869
###################################################
par(mfrow=c(1,2), mar=c(5,5,1,1))
meteoplot(predicted, 1, "Precipitation", ylab="Precipitation (mm)", xlab="",ylim=c(0,80))
#Add uncorrected mean temperature data (cell #5)
lines(bc_dates,
      examplecorrectiondata@projection_data[[3]][as.character(bc_dates),"Precipitation"],
      col="red", lty=3)
legend("topleft", legend=c("corrected","uncorrected"), col=c("black","red"), lty=c(1,3), bty="n")
plot(examplecorrectiondata@projection_data[[3]][as.character(bc_dates),"Precipitation"], ylim=c(0,60), xlim=c(0,60),
     predicted@data[[1]]$Precipitation, cex=0.1, asp=1,
     ylab="Corrected precipitation (mm)", xlab="Uncorrected precipitation (mm)")
abline(a=0,b=1,col="gray")


###################################################
### code chunk number 22: Meteorology.Rnw:876-888
###################################################
par(mfrow=c(1,2), mar=c(5,5,1,1))
#Plot predicted mean temperature for point 1
meteoplot(predicted, 1, "MeanTemperature", ylab="Mean temperature (Celsius)", xlab="",ylim=c(-5,40))
#Add uncorrected mean temperature data (cell #5)
lines(bc_dates,
      examplecorrectiondata@projection_data[[3]][as.character(bc_dates),"MeanTemperature"],
      col="red")
legend("topright", legend=c("corrected","uncorrected"), col=c("black","red"), lty=c(1,1), bty="n")
plot(examplecorrectiondata@projection_data[[3]][as.character(bc_dates),"MeanTemperature"],
     predicted@data[[1]]$MeanTemperature, cex=0.1, asp=1,
     ylab="Corrected mean temperature", xlab="Uncorrected mean temperature")
abline(a=0,b=1,col="gray")


###################################################
### code chunk number 23: Meteorology.Rnw:896-915
###################################################
par(mfrow=c(2,2), mar=c(5,5,1,1))
meteoplot(predicted, 1, "MinTemperature", ylab="Minimum temperature (Celsius)", xlab="",ylim=c(-10,25))
lines(bc_dates,
      examplecorrectiondata@projection_data[[3]][as.character(bc_dates),"MinTemperature"],
      col="red")
legend("topright", legend=c("corrected","uncorrected"), col=c("black","red"), lty=c(1,1), bty="n")
plot(examplecorrectiondata@projection_data[[3]][as.character(bc_dates),"MinTemperature"],
     predicted@data[[1]]$MinTemperature, cex=0.1, asp=1,
     ylab="Corrected minimum temperature", xlab="Uncorrected minimum temperature")
abline(a=0,b=1,col="gray")
meteoplot(predicted, 1, "MaxTemperature", ylab="Maximum temperature (Celsius)", xlab="",ylim=c(0,40))
lines(bc_dates,
      examplecorrectiondata@projection_data[[3]][as.character(bc_dates),"MaxTemperature"],
      col="red")
legend("topright", legend=c("corrected","uncorrected"), col=c("black","red"), lty=c(1,1), bty="n")
plot(examplecorrectiondata@projection_data[[3]][as.character(bc_dates),"MaxTemperature"],
     predicted@data[[1]]$MaxTemperature, cex=0.1, asp=1,
     ylab="Corrected maximum temperature", xlab="Uncorrected maximum temperature")
abline(a=0,b=1,col="gray")


###################################################
### code chunk number 24: Meteorology.Rnw:921-933
###################################################
par(mfrow=c(1,2), mar=c(5,5,1,1))
meteoplot(predicted, 1, "Radiation", ylab="Radiation (MJ m-2)", xlab="",ylim=c(0,40))
#Add uncorrected mean temperature data (cell #5)
lines(bc_dates,
      examplecorrectiondata@projection_data[[3]][as.character(bc_dates),"Radiation"],
      col="red")
legend("topright", legend=c("corrected","uncorrected"), col=c("black","red"), lty=c(1,1), bty="n")
#Scatter plot
plot(examplecorrectiondata@projection_data[[3]][as.character(bc_dates),"Radiation"],
     predicted@data[[1]]$Radiation, cex=0.1, asp=1,
     ylab="Corrected radiation", xlab="Uncorrected radiation")
abline(a=0,b=1,col="gray")


