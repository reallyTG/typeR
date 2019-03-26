library(wbsts)


### Name: finner_prod_maxp
### Title: The function finds the value which yields the maximum inner
###   product (CUSUM) of a a time series located between 100(1-p)% and
###   100p% of its support
### Aliases: finner_prod_maxp
### Keywords: internal

### ** Examples
 
#cps=seq(from=1000,to=2000,by=200)
#y=sim.pw.arma(N =3000,sd_u = c(1,1.5,1,1.5,1,1.5,1),
#b.slope=rep(0.99,7),b.slope2 = rep(0.,7), mac = rep(0.,7),br.loc = cps)[[2]]
#z=ews.trans(y,scales=c(11,9,8,7,6))
##balanced
#finner_prod_maxp(z[,1],0.51)
##unbalanced
#finner_prod_maxp(z[,1],0.99)



