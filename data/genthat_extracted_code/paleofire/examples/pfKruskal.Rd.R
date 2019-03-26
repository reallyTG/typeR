library(paleofire)


### Name: pfKruskal
### Title: Analyse composite records by a Kruskal-Wallis ANOVA
### Aliases: pfKruskal

### ** Examples

## Not run: 
##D ## Composite charcoal record for Western Boreal North America:
##D ID=pfSiteSel(continent=="North America", long<(-100) & l12==1)
##D plot(ID)
##D ## Transform data
##D res3=pfTransform(ID,method=c("MinMax","Box-Cox","Z-Score"),BasePeriod=c(200,4000))
##D 
##D ## Composite
##D comp=pfComposite(res3,bins=seq(from=-500,to=12500,by=1000))
##D plot(comp)
##D 
##D ## Kruskal Wallis Anova
##D comparison=pfKruskal(comp)
## End(Not run)



