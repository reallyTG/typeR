library(paleofire)


### Name: pfCompositeLF
### Title: Produce a composite serie from multiple charcoal records using a
###   local regression procedure (from the locfit package)
### Aliases: pfCompositeLF

### ** Examples

## Not run: 
##D ID=pfSiteSel(continent=="North America", l12==1, long>=-160 & long<=-140)
##D plot(ID, xlim=c(-180, -130), ylim=c(40,80))
##D TR=pfTransform(ID, method=c("MinMax","Box-Cox","MinMax","Z-Score"),
##D                BasePeriod=c(200,2000),QuantType="INFL")
##D 
##D COMP1=pfCompositeLF(TR, tarAge=seq(-50,4000,10), hw=200, nboot=100)
##D 
##D plot(COMP1)
##D 
##D ## Note: comparing confidence intervals based on 100 replicates is not recommended
##D # (100 is used to decrease analysis time)
##D 
## End(Not run)



