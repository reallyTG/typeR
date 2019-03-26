library(waterData)


### Name: fillMiss
### Title: Fill-in missing hydrological values
### Aliases: fillMiss
### Keywords: NA datagen hplot smooth ts

### ** Examples

data(exampleWaterData)
my.newdata <- fillMiss(misQ05054000, block=30, pmiss=50, log="y")
summary(misQ05054000)
summary(my.newdata)
# ph example
 ## Not run: 
##D pH05082500<-importDVs("05082500", code="00400", stat="00008", 
##D sdate="2000-01-01", edate="2011-12-31")
##D plotParam(pH05082500)
##D pHfilled<-fillMiss(pH05082500, block=45, ylim=c(7.5,9), yaxs="i")
##D  
## End(Not run)



