library(flux)


### Name: flux.calib
### Title: Determine calibration measurement ranges according to the dates
###   of real measurements
### Aliases: flux.calib
### Keywords: manip univar

### ** Examples

## load example data
data(tt.pre)

## extract field concentration measurements
gcd <- tt.pre[tt.pre$sampletype_a=="P",]

## partition the data into data tables per chamber measurement
gcd.parts <- chop(gcd, factors = c("date", "spot", "veg"), 
nmes = c("date", "veg", "spot"))

## calculate range limits according to the data and the accompanying 
## calibration gas measurements
# extract and prepare calibration measurements
cal <- tt.pre[tt.pre$sampletype_a=="E",c("date_gc", "CH4ppb", "CH4Code", 
"CO2ppm", "CO2Code", "N2Oppb", "N2OCode")]
names(cal)[1] <- "date"
cal$date <- "2011-03-16"
# calculate the range limits per gas (makes no real sense with such
# a small dataset).
# CH4 range limits 
CH4.lims <- flux.calib(gcd.parts, columns = c("date", "CH4ppb"), 
calib = cal, format="%Y-%m-%d", window=48, attach=FALSE, buffer=1100)
# N2O range limits 
N2O.lims <- flux.calib(gcd.parts, columns = c("date", "N2Oppb"), 
calib = cal, format="%Y-%m-%d", window=48, attach=FALSE, buffer=1100)
# CO2 range limits 
CO2.lims <- flux.calib(gcd.parts, columns = c("date", "CO2ppm"), 
calib = cal, format="%Y-%m-%d", window=48, attach=FALSE, buffer=1100)

## attach the range limits to the original data
gcd.parts.cal <- flux.calib(gcd.parts, columns = c("date", "CH4ppb"), 
calib = cal, format = "%Y-%m-%d", attach = TRUE, window=48, buffer=1100)




