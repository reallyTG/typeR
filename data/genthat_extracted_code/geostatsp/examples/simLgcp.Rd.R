library(geostatsp)


### Name: simLgcp
### Title: Simulate a log-Gaussian Cox process
### Aliases: simLgcp simPoissonPP

### ** Examples

mymodel = c(mean=-0.5, variance=1, 
				range=2, shape=2)

myraster = raster(nrows=15,ncols=20,xmn=0,xmx=10,ymn=0,ymx=7.5)

# some covariates, deliberately with a different resolution than myraster
covA = covB = myoffset = raster(extent(myraster), 10, 10)
values(covA) = as.vector(matrix(1:10, 10, 10))
values(covB) = as.vector(matrix(1:10, 10, 10, byrow=TRUE))
values(myoffset) = round(seq(-1, 1, len=ncell(myoffset)))

myCovariate = list(a=covA, b=covB, offsetFooBar = myoffset)

myLgcp=simLgcp(param=mymodel, 
	covariates=myCovariate, 
	betas=c(a=-0.1, b=0.25), 
	offset='offsetFooBar',
	rasterTemplate=myraster)

plot(myLgcp$raster[["intensity"]], main="lgcp")
points(myLgcp$events)

myIntensity = exp(-1+0.2*myCovariate[["a"]])
myPoissonPP = simPoissonPP(myIntensity)[[1]]
plot(myIntensity, main="Poisson pp")
points(myPoissonPP)





