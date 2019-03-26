library(GWEX)


### Name: fitGwexModel
### Title: fitGwexModel: fit a GWex model to observations.
### Aliases: fitGwexModel

### ** Examples

# Format dates corresponding to daily observations of precipitation and temperature
vecDates = seq(from=as.Date("01/01/2005",format="%d/%m/%Y"),
to=as.Date("31/12/2014",format="%d/%m/%Y"),by='day')

###############################################################
#               FIT THE PRECIPITATION MODEL
###############################################################

# Format observations: create a G-Wex object
myObsPrec = GwexObs(variable='Prec',date=vecDates,obs=dailyPrecipGWEX[,1:2])

# Example of a data.frame which can be used for 'xiHat'. For each month, xi values 
#can be prescribed, for example using a regionalisation method.
xiReg = data.frame(station=c('S1','S2','S3'),JAN=c(0,0,0.06),FEB=c(0,0,0.06),
MAR=c(0,0,0.01),APR=c(0,0,0.01),MAY=c(0,0,0.01),
JUN=c(0,0.01,0.14),JUL=c(0,0.01,0.14),AUG=c(0,0.01,0.14),
SEP=c(0,0,0.02),OCT=c(0,0,0.02),NOV=c(0,0,0.02),
DEC=c(0,0,0.06))

# Options: specify the threshold for precipitation (0.5 mm) to distinguish wet and 
# dry states (th), xi values for the DGPD distribution (xiHat), a Student copula for 
# the spatial dependence (copulaInt), a model based on 3-day aggregated values 
# (is3Damount), a MAR(1) process (isMAR), a EGPD distribution for marginal intensities
# ('typeMargin'), and 200 replicates for the runs used during the fitting process
# (this value being 100,000 by default, in order to obtain a reasonable precision of the 
# estimates) 
list.options = list(th=0.5,nLag=1,xiHat=xiReg,copulaInt='Student',is3Damount=TRUE,isMAR=TRUE,
typeMargin='EGPD',nChainFit=200)

# Fit precipitation model
myParPrec = fitGwexModel(myObsPrec,list.options) # fit model
myParPrec # print object

###############################################################
#     FIT THE TEMPERATURE MODEL, COND. TO PRECIPITATION
###############################################################
# Format observations: create a G-Wex object
myObsTemp = GwexObs(variable='Temp',date=vecDates,obs=dailyTemperGWEX)

# Fit temperature model with a long-term linear trend ('hasTrend'), Gaussian margins 
# ('typeMargin') and Gaussian spatial dependence ('depStation')
myParTemp = fitGwexModel(myObsTemp,listOption=list(hasTrend=TRUE,typeMargin='Gaussian',
depStation='Gaussian'))
myParTemp # print object



