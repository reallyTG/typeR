library(iSDM)


### Name: plotRPD
### Title: R function to plot the realized versus the potential
###   distribution using a RGB colour space
### Aliases: plotRPD

### ** Examples

## Not run: 
##D library(raster)
##D library(sp)
##D library(virtualspecies)
##D library(colorRamps)
##D 
##D envData<-getData('worldclim', var='bio', res=10)
##D envData<-crop(envData,extent(-8,15,38,55))
##D 
##D # Generate virtual species responses with formatfunctions
##D my.parameters <- formatFunctions(bio1 = c(fun = "dnorm", mean = 140, sd = 40), 
##D bio5 = c(fun = "dnorm",mean = 230, sd = 70),
##D bio6 = c(fun = "dnorm",mean = 10, sd = 40))
##D # Generate a virtual species potential distributions with responses to environmental variables
##D potential.dist <- generateSpFromFun(envData[[c(1,5,6)]], my.parameters)$suitab.raster
##D 
##D #Limit the distribution 
##D realized.dist<-potential.dist
##D cell.id<-which(coordinates(realized.dist)[,2]>48)
##D dis.lim<-sample(seq(0,1,by=0.01),length(cell.id),replace=TRUE)
##D values(realized.dist)[cell.id]<-ifelse(values(realized.dist)[cell.id]>dis.lim,
##D values(realized.dist)[cell.id]-dis.lim,0)
##D plotRPD(x=potential.dist,y=realized.dist,cex=0.8,xlab="Potential distribution"
##D ,ylab="Realized distribution")
## End(Not run)



