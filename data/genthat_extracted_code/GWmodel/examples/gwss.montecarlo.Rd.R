library(GWmodel)


### Name: gwss.montecarlo
### Title: Monte Carlo (randomisation) test for gwss
### Aliases: gwss.montecarlo montecarlo.gwss
### Keywords: test, summary stastics

### ** Examples

## Not run: 
##D data(LondonHP)
##D DM<-gw.dist(dp.locat=coordinates(londonhp))
##D test.lss<-gwss.montecarlo(data=londonhp, vars=c("PURCHASE","FLOORSZ"), bw=5000,
##D           kernel ="gaussian", dMat=DM,nsim=99)
##D test.lss
## End(Not run)



