library(Rtwalk)


### Name: Runtwalk
### Title: Run the 't-walk'
### Aliases: Runtwalk
### Keywords: Automatic self adjusting MCMC

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
### Or time series of the parameters
TS(info)
### or plot the log of the objective
PlotLogObj(info)
### and remove the burn-in
PlotLogObj(info, from=500)
PlotHist(info, par=3, from=500)
TS( info, from=500)
### And do some basic autocorrelation analysis
Ana( info, from=500)

### And save the output as columns in a table
SaveOutput( info, file="Tsttwalk.dat")
### SaveOutput is simply a wraper to the write.table function



########### A more complex Objective,
########### the posterior of alpha (shape) and beta (rate) in gamma sampling
########### The prior for alpha is U( 1, 4) and for beta is Exp(1)

### a initialization function
GaSamInit <- function(sample.size=100) {
	
	### Set the dimension as the global variable npars
	npars <<- 2 ## alpha and beta 	
	
	### sample 100 gammas with the true parameters 2.5 and 3
	m <<- sample.size ### sample size, now global variable m
	smpl <- rgamma( sample.size, shape=2.5, rate=3)
	
	### calculate the suff. statistics 
	r1 <<- sum(smpl)
	r2 <<- sum(log(smpl))
}

### This is the -log of the posterior, -log of the objective
GaSamU <- function(x) {

	al <- x[1]
	be <- x[2]
	
	### It is VERY advisable to try to do the calculations inside -log post:
	-1*m*al*log(be) + m*lgamma(al) + (1-al)*r2 + be*(1+r1) 
}

### This is the support:
GaSamSupp <- function(x) {

	(((0 < x[1]) & (x[1] < 4)) & (0 < x[2]))	
}

### Is also very advisable to have a function that generates initial (random?) points
### anything "within the same galaxy of the objective" most probabbly work
### for example, sample from the prior
GaSamX0 <- function(x) { c( runif(1, min=1, max=4), rexp(1,rate=1)) }

### The twalk is run with
### Don't forget to initialize the problem:
GaSamInit()
info <- Runtwalk( dim=npars,  Tr=1000,  Obj=GaSamU, Supp=GaSamSupp, x0=GaSamX0(), xp0=GaSamX0()) 

### This no longer works!!!
### Value of dim taken from the global var n
#n <- npars
#info <- Runtwalk( Tr=1000,  Obj=GaSamU, Supp=GaSamSupp, x0=GaSamX0(), xp0=GaSamX0()) 


###  See this and many more examples in:  \url{http://www.cimat.mx/~jac/twalk/examples.R}



