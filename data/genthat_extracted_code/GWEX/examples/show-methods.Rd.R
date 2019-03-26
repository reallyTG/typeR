library(GWEX)


### Name: show,Gwex-method
### Title: show-methods: Create a method to show Gwex objects.
### Aliases: show,Gwex-method show,GwexObs-method show,GwexFit-method
###   show,GwexSim-method

### ** Examples

# Format dates corresponding to daily observations of precipitation and temperature
vecDates = seq(from=as.Date("01/01/2005",format="%d/%m/%Y"),
to=as.Date("31/12/2014",format="%d/%m/%Y"),by='day')

# build GwexObs object with temperature data
myObsTemp = GwexObs(variable='Temp',date=vecDates,obs=dailyTemperGWEX)

# show GwexObs object
myObsTemp

# show GwexFit object
myParPrecGWEX 



