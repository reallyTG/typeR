library(pems.utils)


### Name: 1.1.make.import.data
### Title: making and importing data
### Aliases: 1.1.make.import.data pems.objects is.pems isPEMS pems makePEMS
###   rebuildPEMS pems.element as.pems as.pems.default as.pems.data.frame
###   makePEMSElement import2PEMS importTAB2PEMS importCSV2PEMS
###   importOBS2PEMS importOB12PEMS importParSYNC2PEMS importCAGE2PEMS
###   importRoyalTek2PEMS importKML2PEMS importSEMTECH2PEMS
### Keywords: methods

### ** Examples


###########
##example 1 
###########

#make little pems

data <- data.frame(speed=1:10, emissions=1:10)
units <- c("m/s", "g/s")
pems <- pems(x = data, units=units, example="my record") 
 
pems                       #the pems object
summary(pems)              #summary of held data
pems$speed                 #the speed pems.element

#import data file as pems using import... functions

#For example, to import CSV file as pems object 
## Not run: 
##D pems <- importCSV2PEMS() 
## End(Not run)




