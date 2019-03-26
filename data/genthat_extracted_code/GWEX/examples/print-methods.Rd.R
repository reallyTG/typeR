library(GWEX)


### Name: print,Gwex-method
### Title: print-methods: Create a method to print Gwex objects.
### Aliases: print,Gwex-method print,GwexObs-method print,GwexFit-method
###   print,GwexSim-method

### ** Examples

# Format dates corresponding to daily observations of precipitation and temperature
vecDates = seq(from=as.Date("01/01/2005",format="%d/%m/%Y"),
to=as.Date("31/12/2014",format="%d/%m/%Y"),by='day')

# build GwexObs object with temperature data
myObsTemp = GwexObs(variable='Temp',date=vecDates,obs=dailyTemperGWEX)

# print GwexObs object
myObsTemp

# print GwexFit object
myParPrecGWEX 



