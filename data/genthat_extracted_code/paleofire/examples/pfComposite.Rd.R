library(paleofire)


### Name: pfComposite
### Title: Produce a composite serie from multiple charcoal records
### Aliases: pfComposite

### ** Examples

## Not run: 
##D ## Composite charcoal record for boreal Canada:
##D ID=pfSiteSel(country=="Canada" & l12==1)
##D plot(ID)
##D ## Transform data
##D res3=pfTransform(ID,method=c("MinMax","Box-Cox","Z-Score"),BasePeriod=c(200,4000))
##D 
##D ## Composite
##D comp=pfComposite(res3,bins=seq(from=0,to=12000,by=200))
##D plot(comp)
## End(Not run)



