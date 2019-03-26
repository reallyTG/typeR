library(GWEX)


### Name: GwexObs
### Title: Constructor
### Aliases: GwexObs

### ** Examples

# Format dates corresponding to daily observations of precipitation and temperature
vecDates = seq(from=as.Date("01/01/2005",format="%d/%m/%Y"),
to=as.Date("31/12/2014",format="%d/%m/%Y"),by='day')

# build GwexObs object with precipitation data
myObsPrec = GwexObs(variable='Prec',date=vecDates,obs=dailyPrecipGWEX)

# print GwexObs object
myObsPrec 

# build GwexObs object with temperature data
myObsTemp = GwexObs(variable='Temp',date=vecDates,obs=dailyTemperGWEX)

# print GwexObs object
myObsTemp



