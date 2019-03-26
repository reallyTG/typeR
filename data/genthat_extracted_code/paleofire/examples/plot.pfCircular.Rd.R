library(paleofire)


### Name: plot.pfCircular
### Title: plot.pfCircular
### Aliases: plot.pfCircular

### ** Examples

## Not run: 
##D ID=pfSiteSel(lat>49,lat<75,long>6,long<50)
##D TR1=pfTransform(ID, method=c("MinMax","Box-Cox","Z-Score"),BasePeriod=c(200,2000))
##D 
##D ## Circular block bootstrapp
##D COMP=pfComposite(TR1, binning=TRUE, bins=seq(0,2000,100))
##D circ=pfCircular(COMP,conf=c(0.005,0.025,0.975,0.995),nboot=100)
##D plot(circ)
## End(Not run)



