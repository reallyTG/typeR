library(wbsts)


### Name: wbs.lsw
### Title: Change point detection for a nonstationary process using Wild
###   Binary Segmentation
### Aliases: wbs.lsw
### Keywords: change-points, detection, segmentation, randomised

### ** Examples

#### Generate a highly persistent time series with changing variance and of length 5,000
###Location of the change-points
#cps=seq(from=1000,to=2800,by=200)
#y=sim.pw.arma(N =3000,sd_u = c(1,1.5,1,1.5,1,1.5,1,1.5,1,1.5,1),
#b.slope=rep(0.99,11),b.slope2 = rep(0.,11), mac = rep(0.,11),br.loc = cps)[[2]]
###Estimate the change points via Binary Segmentation
#wbs.lsw(y,M=1)$cp.aft
###Estimate the change points via Wild Binary Segmentation
#wbs.lsw(y,M=0)$cp.aft




