library(GWEX)


### Name: simGwexModel
### Title: simGwexModel
### Aliases: simGwexModel

### ** Examples

# vector of dates
vecDates = seq(from=as.Date("01/01/2005",format="%d/%m/%Y"),
to=as.Date("31/12/2014",format="%d/%m/%Y"),by='day')

###############################################################
#               FIT AND SIMULATE FROM THE PRECIPITATION MODEL
###############################################################
# Format observations: create a G-Wex object
myObsPrec = GwexObs(variable='Prec',date=vecDates,obs=dailyPrecipGWEX[,1:2])

# default options except for 'nChainFit'
list.options = list(nChainFit=1000)

# generate 2 scenarios for one year, using a existing 'GwexFit' object
mySimPrec = simGwexModel(objGwexFit=myParPrecGWEX, nb.rep=2, d.start=vecDates[1],
d.end=vecDates[365])
mySimPrec # print object

###############################################################
#     FIT AND SIMULATE FROM THE TEMPERATURE MODEL, COND. TO PRECIPITATION
###############################################################
# Format observations: create a G-Wex object
myObsTemp = GwexObs(variable='Temp',date=vecDates,obs=dailyTemperGWEX)

# generate 2 scenarios for one year, using a existing 'GwexFit' object
mySimTemp = simGwexModel(objGwexFit=myParTempGWEX, nb.rep=2, d.start=vecDates[1], 
d.end=vecDates[365])
mySimTemp # print object



