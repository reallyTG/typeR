library(GWmodel)


### Name: gwr.montecarlo
### Title: Monte Carlo (randomisation) test for significance of GWR
###   parameter variability
### Aliases: gwr.montecarlo montecarlo.gwr
### Keywords: MonteCarlo , test

### ** Examples

## Not run: 
##D data(LondonHP)
##D DM<-gw.dist(dp.locat=coordinates(londonhp))
##D bw<-bw.gwr(PURCHASE~FLOORSZ,data=londonhp,dMat=DM, kernel="gaussian")
##D #See any difference in the next two commands and why?
##D res.mont1<-gwr.montecarlo(PURCHASE~PROF+FLOORSZ, data = londonhp,dMat=DM,
##D nsim=99, kernel="gaussian", adaptive=FALSE, bw=3000)
##D res.mont2<-gwr.montecarlo(PURCHASE~PROF+FLOORSZ, data = londonhp,dMat=DM,
##D nsim=99, kernel="gaussian", adaptive=FALSE, bw=300000000000)
## End(Not run)



