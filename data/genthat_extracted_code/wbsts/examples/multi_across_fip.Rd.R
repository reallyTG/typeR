library(wbsts)


### Name: multi_across_fip
### Title: The value that maximises the random CUSUM statistic across all
###   the scales (C++ version)
### Aliases: multi_across_fip

### ** Examples
 
#cps=seq(from=1000,to=2000,by=200)
#y=sim.pw.arma(N =3000,sd_u = c(1,1.5,1,1.5,1,1.5,1),
#b.slope=rep(0.99,7),b.slope2 = rep(0.,7), mac = rep(0.,7),br.loc = cps)[[2]]
#z=ews.trans(y,scales=c(11,9,8,7,6))
#out=multi_across_fip(X=z, M=1000, min_draw=100,
#tau=tau.fun(y), p=c(.95,.95),epp=rep(32,5),Ts= length(y))



