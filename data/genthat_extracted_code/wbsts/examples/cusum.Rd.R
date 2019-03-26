library(wbsts)


### Name: cusum
### Title: A C++ implementation of the CUSUM statistic
### Aliases: cusum

### ** Examples
 
cps=seq(from=1000,to=2000,by=200)
y=sim.pw.arma(N =3000,sd_u = c(1,1.5,1,1.5,1,1.5,1),
b.slope=rep(0.99,7),b.slope2 = rep(0.,7), mac = rep(0.,7),br.loc = cps)[[2]]
z=ews.trans(y,scales=c(11,9,8,7,6))
ts.plot(abs(wbsts::cusum(z[10:2990,2])))




