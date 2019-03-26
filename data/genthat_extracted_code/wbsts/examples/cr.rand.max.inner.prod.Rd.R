library(wbsts)


### Name: cr.rand.max.inner.prod
### Title: The value that maximises the random CUSUM statistic across all
###   the scales
### Aliases: cr.rand.max.inner.prod

### ** Examples
 
#cps=seq(from=1000,to=2000,by=200)
#y=sim.pw.arma(N =3000,sd_u = c(1,1.5,1,1.5,1,1.5,1),
#b.slope=rep(0.99,7),b.slope2 = rep(0.,7), mac = rep(0.,7),br.loc = cps)[[2]]
#z=ews.trans(y,scales=c(11,9,8,7,6))
#out=cr.rand.max.inner.prod(z, Ts = length(y),C_i = tau.fun(y), 
#epp = rep(32,5), M = 2000, cstar = 0.75, Plot = 1)
#abline(v=cps,col="red")



