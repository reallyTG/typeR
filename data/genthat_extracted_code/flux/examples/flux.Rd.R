library(flux)


### Name: flux
### Title: Estimate gas flux rates using non-steady-state closed chamber
###   data
### Aliases: flux flux.odae flux.conv
### Keywords: univar

### ** Examples

## load example data
data(tt.pre)

## extract field concentration measurements
gcd <- tt.pre[tt.pre$sampletype_a=="P",]

## partition the data into data tables per chamber measurement
# then do the partitioning
gcd.parts <- chop(gcd, factors = c("date", "spot", "veg"), 
nmes = c("date", "veg", "spot"))

## calculate flux rates for methane
# first define a global CH4 range limit
CH4.lim <- 30
# do the flux rate estimation (it will often be best to define
# var.par separately, note that p.air is given as a parameter)
vp.CH4 <- list(CH4 = "CH4ppb", time = "time_min", CH4.gcq = "CH4Code", 
volume = "cham_vol", t.air = "temp_dC", area = "cham_area", p.air = 101325)
flux.CH4 <- flux(gcd.parts, var.par = vp.CH4)
# look at the results table
flux.CH4

# extracting range limits from the calibration gas measurements
# and attaching them to gcd.parts. first get the calibration gas
# measurements from tt.pre (changing the date because it is in 
# a strange format and has to be the same as the dates in gcd.parts)
cgm <- tt.pre[tt.pre$sampletype_a=="E",c("date_gc", "CH4ppb", "CH4Code", 
"CO2ppm", "CO2Code", "N2Oppb", "N2OCode")]
names(cgm)[1] <- "date"
cgm$date <- "2011-03-16"
# now we can do the flux.calib
gcd.parts.cal <- flux.calib(gcd.parts, columns = c("date", "CH4ppb"), 
calib = cgm, format="%Y-%m-%d", window=48, buffer=1100, attach=TRUE)
# do the flux rate estimation (we use the same var.par as before)
flux.CH4 <- flux(gcd.parts.cal, var.par=vp.CH4, co2ntrol = NULL, 
range.lim=NULL)
# look at the results table
flux.CH4
# export the results to the working directory
wd <- getwd()
export(flux.CH4, file=paste(wd, "/flux.CH4.txt", sep=""))

## plot the concentration-change-with-time-plots as kind of diagnostic
plot(flux.CH4, dims = c(3,6))

## do the flux rate estimation whilst using CO2 concentrations to
## control for possible chamber leakage
flux.CH4.b <- flux(gcd.parts, var.par=vp.CH4)
# look at the results table
flux.CH4.b
# plot the concentration-change-with-time-plots as kind of diagnostic
plot(flux.CH4.b, dims = c(3,6))

## do the flux rate estimation whilst using CO2 concentrations to
## control for outliers and possible chamber leakage
flux.CH4.c <- flux(gcd.parts, var.par=vp.CH4, co2ntrol = list(leak = TRUE, 
relay = FALSE))
# look at the results table
flux.CH4.c
# plot the concentration-change-with-time-plots as kind of diagnostic
plot(flux.CH4.c, dims = c(3,6))




