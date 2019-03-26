library(rcarbon)


### Name: permTest
### Title: Random mark permutation test for SPDs
### Aliases: permTest

### ** Examples

## compare demographic trajectories in Netherlands and Denmark  
## Not run: 
##D  
##D data(euroevol)
##D nld.dnk = subset(euroevol,Country=="Netherlands"|Country=="Denmark")
##D bins = binPrep(nld.dnk$SiteID,nld.dnk$C14Age,h=200)
##D dates = calibrate(nld.dnk$C14Age,nld.dnk$C14SD,normalised=FALSE)
##D res = permTest(dates,marks=as.character(nld.dnk$Country),nsim=1000,
##D bins=bins,runm=200,timeRange=c(10000,4000))
##D round(res$pValueList,4) #extract p-values
##D summary(res)
##D par(mfrow=c(2,1))
##D plot(res,focalm="Netherlands",main="Netherlands")
##D plot(res,focalm="Denmark",main="Denmark")
## End(Not run)



