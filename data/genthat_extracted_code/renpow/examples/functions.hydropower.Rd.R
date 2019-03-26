library(renpow)


### Name: Hydro Power
### Title: Hydroelectric Power Functions
### Aliases: hydropower P.hA P.Qh Pmax.Qh Pe.Pw Pmax.Qh.plot
###   turbine.regions turbine.regions.all pipe.loss
### Keywords: hplot dplot math

### ** Examples


# head 3 m and cross-sectional area of 2 m2
x <- list(h=3,A=2); P.hA(x) 

x <- list(Q=1000,h=15); Pmax.Qh(x)

x <- list(Q=1000,h=15,nu=0.9); Pe.Pw(x)

x <- list(h=1,Q=100); P.Qh(x)

x <- list(Q=1000,h=15,plab="A"); Pmax.Qh.plot(x)
turbine.regions(type='francis')

x <- list(Q=0.01,d=0.075,L=200,mat='pvc')
hL <- pipe.loss(x)[1,1]
x <- list(h=30-hL,Q=0.01,nu=0.9)
P.Qh(x)




