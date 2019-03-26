library(LabourMarketAreas)


### Name: AddStatistics
### Title: AddStatistics
### Aliases: AddStatistics

### ** Examples

# compute population totals at LMA level from population values at community level.
out<- findClusters(LWCom=Brindisi, minSZ=1000,minSC=0.6667,tarSZ=10000,tarSC=0.75, 
verbose=TRUE)
AddStatistics(shpBrindisi@data[,c("PRO_COM","POP2001")], "PRO_COM",out$lma,"community" )



