library(GWmodel)


### Name: gwpca.montecarlo.2
### Title: Monte Carlo (randomisation) test for significance of GWPCA
###   eigenvalue variability for the first component only - option 2
### Aliases: gwpca.montecarlo.2 montecarlo.gwpca.2
### Keywords: Monte Carlo, GWPCA

### ** Examples

## Not run: 
##D data(DubVoter)
##D DM<-gw.dist(dp.locat=coordinates(Dub.voter))
##D gmc.res.autow<-gwpca.montecarlo.2(data=Dub.voter, vars=c("DiffAdd", "LARent",
##D "SC1", "Unempl", "LowEduc"), dMat=DM,adaptive=TRUE)
##D gmc.res.autow
##D plot.mcsims(gmc.res.autow)
## End(Not run)



