library(renpow)


### Name: Wind Power
### Title: Wind Power calculations and statistics
### Aliases: windpower pow.rho.v3.table pow.rho.v3 rho.pT.air rho.zT.air
###   pow.v3.plot pow.wind v.H betz cal.vH weibull.plot cdf.plot fit.wind
###   pow.class power.curve prob.power.curve wind.energy
### Keywords: hplot dplot math

### ** Examples


x <- list(rho=1.225,v=10,A=1); pow.rho.v3.table(x)

x <- list(rho=c(0.9,1,1.1,1.225,1.3),v=seq(0,10),A=1)
X <- pow.rho.v3(x)

x <- list(v=X$v,y=X$rho,Pow=X$Pow,yleg="rho",ylabel="Density(kg/m3)")
pow.v3.plot(x)

x <- list(z=1000, T.C=10, punit="bar")
rho.zT.air(x)
x <- list(z=100, T.C=30, punit="bar")
rho.zT.air(x)

x <- list(z=1000, T.C=c(10,20,30), v=seq(0,30),punit="bar",
          lapse=6,yleg="T.C",ylabel="Temperature (C)")
pow.wind(x)

x <- list(alpha=c(0.1,0.25,0.4),rough=c(0.1,0.4,1.6))
v.H(x)




