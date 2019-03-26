library(STAR)


### Name: mkREdf
### Title: Evaluates RateEvolutions for spikeTrain Lists and Returns Data
###   Frame
### Aliases: mkREdf
### Keywords: ts

### ** Examples

## load Purkinje cell data recorded in cell-attached mode
data(sPK)
## coerce sPK to a spikeTrain object
sPK <- lapply(sPK, as.spikeTrain)
## get a rate evolution data frame
sPKreDF <- mkREdf(sPK)
## display result using coplot
coplot(rate ~ time | longitudinal,data=sPKreDF,panel=lines,show.given=FALSE)
## Not run: 
##D ## make it prettier with with xyplot of package lattice
##D library(lattice)
##D xyplot(rate ~ time | longitudinal, data=sPKreDF,panel=panel.lines)
##D ## if ggplot2 is installed, try it out
##D library(ggplot2)
##D qplot(time,rate,data=sPKreDF,geom="line",colour=longitudinal)
## End(Not run)

## load Purkinje cell data recorded with the NeuroNexus probes
data(mPK)
mPK <- lapply(mPK, as.repeatedTrain)
## get a rate evolution data frame
mPKreDF <- mkREdf(mPK)
## use coplot to display result
coplot(rate ~ time | longitudinal * across,data = mPKreDF,panel=lines)
## Not run: 
##D ## make it prettier with with xyplot of package lattice
##D library(lattice)
##D xyplot(rate ~ time | across,data = mPKreDF,groups=longitudinal,panel=panel.lines)
##D xyplot(rate ~ time | across * longitudinal,data = mPKreDF, panel=panel.lines)
##D ## if ggplot2 is installed, try it out
##D library(ggplot2)
##D qplot(time,rate,data=mPKreDF,geom="line",colour=longitudinal,facets=across ~ .)
## End(Not run)

## another example with the CAL1V data set
data(CAL1V)
CAL1V <- lapply(CAL1V,as.repeatedTrain)
## generate the data frame specifying the longitudinal argument
## to end up with a clearer display
CAL1VreDF <- mkREdf(CAL1V,longitudinal=paste(1:20))
coplot(rate ~ time | across * longitudinal,data=CAL1VreDF,panel=lines,show.given=FALSE)
## Not run: 
##D ## if ggplot2 is installed, try it out
##D library(ggplot2)
##D qplot(time,rate,data=CAL1VreDF,geom="line",facets=longitudinal ~ across)
## End(Not run)

## another example with the CAL2C data set
data(CAL2C)
CAL2C <- lapply(CAL2C,as.repeatedTrain)
## generate the data frame specifying the longitudinal argument
## to end up with a clearer display
CAL2CreDF <- mkREdf(CAL2C,longitudinal=paste(1:20))
coplot(rate ~ time | across * longitudinal,data=CAL2CreDF,panel=lines,show.given=FALSE)
## Not run: 
##D ## if ggplot2 is installed, try it out
##D library(ggplot2)
##D qplot(time,rate,data=CAL2CreDF,geom="line",facets=longitudinal ~ across)
## End(Not run)




