library(BMS)


### Name: plotComp
### Title: Compare Two or More bma Objects
### Aliases: plotComp
### Keywords: hplot

### ** Examples

## sample two simple bma objects
data(datafls)
mm1=bms(datafls[,1:15])
mm2=bms(datafls[,1:15])

#compare PIPs
plotComp(mm1,mm2)

#compare standardized coefficeitns
plotComp(mm1,mm2,comp="Std Mean")

#...based on the lieklihoods of best models 
plotComp(mm1,mm2,comp="Std Mean",exact=TRUE)

#plot only PIPs for first four covariates
plotComp(mm1,mm2,varNr=1:4, col=c("black","red"))

#plot only coefficients for covariates 'GDP60 ' and 'LifeExp'
plotComp(mm1,mm2,varNr=c("GDP60", "LifeExp"),comp="Post Mean")






