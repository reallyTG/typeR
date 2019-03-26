library(paleofire)


### Name: contrib.pfCompositeLF
### Title: contrib.pfCompositeLF
### Aliases: contrib.pfCompositeLF

### ** Examples

## Not run: 
##D ID=pfSiteSel(continent=="North America", l12==1, long>=-160 & long<=-140)
##D 
##D TR=pfTransform(ID, method=c("MinMax","Box-Cox","MinMax","Z-Score"),
##D                BasePeriod=c(200,2000),QuantType="INFL")
##D 
##D COMP1=pfCompositeLF(TR, tarAge=seq(-50,4000,10), hw=200, nboot=100)
##D 
##D a=contrib(COMP1)
##D plot(COMP1$BinCentres,a)
## End(Not run)




