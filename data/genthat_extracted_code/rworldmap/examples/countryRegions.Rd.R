library(rworldmap)


### Name: countryRegions
### Title: Regional Classification Table
### Aliases: countryRegions
### Keywords: datasets

### ** Examples


data(countryRegions,envir=environment(),package="rworldmap")
str(countryRegions)

#joining example data onto the regional classifications
data(countryExData,envir=environment(),package="rworldmap")
dF <- merge(countryExData,countryRegions,by.x='ISO3V10',by.y='ISO3')
#plotting ENVHEALTH for Least Developed Countries (LDC) against others
#plot( dF$ENVHEALTH ~ dF$LDC)
#points( y=dF$ENVHEALTH, x=dF$LDC)





