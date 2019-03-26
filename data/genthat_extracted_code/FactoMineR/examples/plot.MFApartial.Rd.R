library(FactoMineR)


### Name: plotMFApartial
### Title: Plot an interactive Multiple Factor Analysis (MFA) graph
### Aliases: plotMFApartial
### Keywords: dplot

### ** Examples

## Not run: 
##D data(wine)
##D res.wine = MFA(wine,group=c(2,5,3,10,9,2),type=c("n",rep("s",5)),ncp=5,
##D     name.group=c("orig","olf","vis","olfag","gust","ens"),
##D     num.group.sup=c(1,6),graph=FALSE)
##D liste = plotMFApartial(res.wine)
## End(Not run)



