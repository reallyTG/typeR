library(Rtwalk)


### Name: PlotLogObj
### Title: Plot a trace of the Log of Objective function values
### Aliases: PlotLogObj
### Keywords: Plot Log Objective MCMC

### ** Examples
  

#### We first load the twalk package:
library(Rtwalk)



#### A ver simple inline example, 4 independent normals N(0,1):
######        dimension,  num of it, -log of objective function besides a const, support,
info <- Runtwalk( dim=4,  Tr=1000,  Obj=function(x) { sum(x^2)/2 }, Supp=function(x) { TRUE },
	x0=runif(4, min=20, max=21), xp0=runif(4, min=20, max=21)) 
####  and two (intentionally bad) initial points

### or plot the log of the objective
PlotLogObj(info)



