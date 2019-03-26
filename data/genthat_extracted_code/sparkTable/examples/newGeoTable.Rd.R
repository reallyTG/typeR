library(sparkTable)


### Name: newGeoTable
### Title: Functions to create a new object of class 'geoTable'
### Aliases: newGeoTable

### ** Examples

  ## Not run: 
##D   ###Example EU population and debt
##D   data(popEU,package="sparkTable")
##D   data(debtEU,package="sparkTable")
##D   data(coordsEU,package="sparkTable")
##D   popEU <- popEU[popEU$country%in%coordsEU$country,]
##D   debtEU <- debtEU[debtEU$country%in%coordsEU$country,]
##D   EU <- cbind(popEU,debtEU[,-1])
##D   EUlong <- reshapeExt(EU,idvar="country",v.names=c("pop","debt"),
##D     varying=list(2:13,14:25),geographicVar="country",timeValues=1999:2010)
##D   l <- newSparkLine()
##D   l <- setParameter(l, 'lineWidth', 2.5)
##D   content <- list(function(x){"Population:"},l,function(x){"Debt:"},l)
##D   varType <- c(rep("pop",2),rep("debt",2))
##D   xGeoEU <- newGeoTable(EUlong, content, varType,geographicVar="country",
##D     geographicInfo=coordsEU)
##D   
## End(Not run)



