library(Rtwalk)


### Name: SaveOutput
### Title: Save the twalk MCMC output to a file.
### Aliases: SaveOutput
### Keywords: Output MCMC

### ** Examples
  

#### We first load the twalk package:
library(Rtwalk)



#### A ver simple inline example, 4 independent normals N(0,1):
######        dimension,  num of it, -log of objective function besides a const, support,
info <- Runtwalk( dim=4,  Tr=1000,  Obj=function(x) { sum(x^2)/2 }, Supp=function(x) { TRUE },
	x0=runif(4, min=20, max=21), xp0=runif(4, min=20, max=21)) 
####  and two (intentionally bad) initial points


### Save the twalk MCMC output as columns in a table
SaveOutput( info, file="Tsttwalk.dat")




