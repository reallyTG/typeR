library(GWmodel)


### Name: gwpca.montecarlo.1
### Title: Monte Carlo (randomisation) test for significance of GWPCA
###   eigenvalue variability for the first component only - option 1
### Aliases: gwpca.montecarlo.1 montecarlo.gwpca.1 plot.mcsims
### Keywords: Monte Carlo, GWPCA

### ** Examples

## Not run: 
##D data(DubVoter)
##D DM<-gw.dist(dp.locat=coordinates(Dub.voter))
##D gmc.res<-gwpca.montecarlo.1(data=Dub.voter, vars=c("DiffAdd", "LARent",
##D "SC1", "Unempl", "LowEduc"), bw=20,dMat=DM,adaptive=TRUE)
##D gmc.res
##D plot(gmc.res)
## End(Not run)



