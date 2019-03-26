library(Rtwalk)


### Name: PlotHist
### Title: Plot a histogram of a
### Aliases: PlotHist
### Keywords: output twalk MCMC

### ** Examples
  

#### We first load the twalk package:
library(Rtwalk)



#### A ver simple inline example, 4 independent normals N(0,1):
######        dimension,  num of it, -log of objective function besides a const, support,
info <- Runtwalk( dim=4,  Tr=1000,  Obj=function(x) { sum(x^2)/2 }, Supp=function(x) { TRUE },
	x0=runif(4, min=20, max=21), xp0=runif(4, min=20, max=21)) 
####  and two (intentionally bad) initial points

### One can plot some histograms:
PlotHist(info, par=3)



