library(LakeMetabolizer)


### Name: calc.lw.net
### Title: Estimate net long wave heat radiation
### Aliases: calc.lw.net calc.lw.net.base
### Keywords: math methods

### ** Examples


## Base example
dateTime <- as.POSIXct("2013-12-30 23:00")
Uz <- 3
airT <- 20
RH <- 90
sw <- 800
wndZ <- 2
Kd <- 2
lat <- 54
lake.area <- 5000 
atm.press <- 1013
Ts <- 22
calc.lw.net.base(dateTime,sw,Ts,lat,atm.press,airT,RH)

## Example using timeseries in a data frame
data.path = system.file('extdata', package="LakeMetabolizer")

sp.data = load.all.data('sparkling', data.path)

# Prep the input data
ts.data	= sp.data$data #pull out just the timeseries data
atm.press	= 1018
lat	= sp.data$metadata$latitude

lwnet = calc.lw.net(ts.data, lat, atm.press)
plot(lwnet$datetime, lwnet$lwnet)




