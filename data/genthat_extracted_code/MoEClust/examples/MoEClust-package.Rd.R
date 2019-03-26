library(MoEClust)


### Name: MoEClust-package
### Title: MoEClust: Gaussian Parsimonious Clustering Models with
###   Covariates
### Aliases: MoEClust MoEClust-package
### Keywords: package

### ** Examples

## Not run: 
##D data(ais)
##D res <- MoE_clust(ais[,3:7], G=2, gating=~BMI, expert=~sex,
##D                  modelNames=c("EVE", "VVE", "VEE"), network.data=ais)
##D plot(res, what="gpairs")
##D 
##D data(CO2data)
##D GNP   <- CO2data[,1]
##D CO2   <- CO2data[,2]
##D m1    <- MoE_clust(CO2, G=1:2)
##D m2    <- MoE_clust(CO2, G=2, gating= ~ GNP)
##D m3    <- MoE_clust(CO2, G=1:2, expert= ~ GNP)
##D m4    <- MoE_clust(CO2, G=2, gating= ~ GNP, expert= ~ GNP)
##D MoE_compare(m1, m2, m3, m4)
## End(Not run)



