library(sparkTable)


### Name: export-methods
### Title: Saves objects of class 'sparkline', 'sparkbar', 'sparkhist' or
###   'sparkbox' to a file
### Aliases: export export-methods export,sparkbar-method
###   export,sparkbox-method export,sparkline-method
###   export,sparkhist-method export,sparkTable-method
###   export,geoTable-method

### ** Examples

## Not run: 
##D data(pop)
##D x <- pop[pop[,2]=="Insgesamt",3]
##D a <- newSparkLine(values=x, pointWidth=8)
##D export(a, outputType=c('pdf','png'), filename='myFirstSparkLine')
##D 
##D # simple graphical table
##D data(pop,package="sparkTable")
##D b <- newSparkBox()
##D l <- newSparkLine()
##D bb <- newSparkBar()
##D content <- list(function(x) { round(mean(x),2) },
##D   b,l,bb,function(x) { round(tail(x,1),2)
##D })
##D names(content) <- paste("column",1:length(content),sep="")
##D varType <- rep("value",length(content))
##D pop <- pop[,c("variable","value","time")]
##D pop$time <- as.numeric(as.character(pop$time))
##D xx <- reshapeExt(pop, varying=list(2))
##D x1 <- newSparkTable(xx, content, varType)
##D export(x1, outputType="html", graphNames="o2",filename="t1")
##D export(x1, outputType="tex", graphNames="o3",filename="t2")
##D 
##D ##Geo-Table: EU population and debt
##D data(popEU,package="sparkTable")
##D data(debtEU,package="sparkTable")
##D data(coordsEU,package="sparkTable")
##D popEU <- popEU[popEU$country%in%coordsEU$country,]
##D debtEU <- debtEU[debtEU$country%in%coordsEU$country,]
##D EU <- cbind(popEU,debtEU[,-1])
##D EUlong <- reshapeExt(EU,
##D   idvar="country",v.names=c("pop","debt"),
##D   varying=list(2:13,14:25),geographicVar="country",timeValues=1999:2010
##D )
##D l <- newSparkLine()
##D l <- setParameter(l, 'lineWidth', 2.5)
##D content <- list(
##D   function(x){"Population:"},
##D   l,function(x){"Debt:"},l)
##D varType <- c(rep("pop",2),rep("debt",2))
##D xGeoEU <- newGeoTable(EUlong, content, varType,geographicVar="country",
##D   geographicInfo=coordsEU)
##D export(xGeoEU, outputType="html", graphNames="outEU",
##D   filename="testEUT",transpose=TRUE)
##D export(xGeoEU, outputType="html", graphNames="outEU1",
##D   filename="testEU", transpose=FALSE)
##D  export(xGeoEU, outputType="tex", graphNames="out1",
##D   filename="testEU",transpose=FALSE)
##D #export(xGeoEU, outputType="tex", graphNames="out1",
##D   filename="testEUT",transpose=TRUE)
## End(Not run)



