library(paleofire)


### Name: plot.pfCompositeLF
### Title: plot.pfCompositeLF
### Aliases: plot.pfCompositeLF

### ** Examples

## Not run: 
##D ID=pfSiteSel(continent=="North America", l12==1, long>=-160 & long<=-140)
##D 
##D TR=pfTransform(ID, method=c("MinMax","Box-Cox","MinMax","Z-Score"),
##D                BasePeriod=c(200,2000),QuantType="INFL")
##D 
##D COMP1=pfCompositeLF(TR, tarAge=seq(-50,4000,10), hw=200, nboot=999)
##D 
##D plot(COMP1, type="density")
##D 
## End(Not run)




