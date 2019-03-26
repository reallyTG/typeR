library(paleofire)


### Name: plot.pfComposite
### Title: plot.pfComposite
### Aliases: plot.pfComposite

### ** Examples

## Not run: 
##D # Composite charcoal record for boreal Canada:
##D ID=pfSiteSel(country=="Canada" & l12==1)
##D ## Transform data
##D res3=pfTransform(ID,method=c("MinMax","Box-Cox","Z-Score"),BasePeriod=c(200,4000))
##D 
##D ## Composite
##D comp=pfComposite(res3,bins=seq(0,5000,200))
##D plot(comp,type="density",smoothing=TRUE,spar=0.3)
## End(Not run)



