library(Rtwalk)


### Name: Ana
### Title: Perform some basic autocorrelation analysis.
### Aliases: Ana
### Keywords: Autocorrelations IAT MCMC

### ** Examples
  

#### We first load the twalk package:
library(Rtwalk)



#### A ver simple inline example, 4 independent normals N(0,1):
######        dimension,  num of it, -log of objective function besides a const, support,
info <- Runtwalk( dim=4,  Tr=1000,  Obj=function(x) { sum(x^2)/2 }, Supp=function(x) { TRUE },
	x0=runif(4, min=20, max=21), xp0=runif(4, min=20, max=21)) 
####  and two (intentionally bad) initial points

### Perform some basic autocorrelation analysis
Ana( info, from=500)




