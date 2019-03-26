library(RandomFields)


### Name: plot-method
### Title: Methods for function 'plot' in package 'RandomFields'
### Aliases: plot-method plot,RFgridDataFrame,missing-method
###   plot,RFpointsDataFrame,missing-method
###   plot,RFspatialGridDataFrame,missing-method
###   plot,RFspatialPointsDataFrame,missing-method
###   plot,RFgridDataFrame,matrix-method
###   plot,RFpointsDataFrame,matrix-method
###   plot,RFspatialGridDataFrame,matrix-method
###   plot,RFspatialPointsDataFrame,matrix-method
###   plot,RFgridDataFrame,data.frame-method
###   plot,RFpointsDataFrame,data.frame-method
###   plot,RFspatialGridDataFrame,data.frame-method
###   plot,RFspatialPointsDataFrame,data.frame-method
###   plot,RFgridDataFrame,RFgridDataFrame-method
###   plot,RFgridDataFrame,RFpointsDataFrame-method
###   plot,RFpointsDataFrame,RFgridDataFrame-method
###   plot,RFpointsDataFrame,RFpointsDataFrame-method
###   plot,RFspatialGridDataFrame,RFspatialGridDataFrame-method
###   plot,RFspatialGridDataFrame,RFspatialPointsDataFrame-method
###   plot,RFspatialPointsDataFrame,RFspatialGridDataFrame-method
###   plot,RFspatialPointsDataFrame,RFspatialPointsDataFrame-method
###   persp,RFspatialGridDataFrame-method contour.RFspatialGridDataFrame
###   RFplotSimulation RFplotSimulation1D
### Keywords: methods

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## define the model:
model <- RMtrend(mean=0.5) + # mean
         RMstable(alpha=1, var=4, scale=10) + # see help("RMstable")
                                        ## for additional arguments
         RMnugget(var=1) # nugget


#############################################################
## Plot of covariance structure


plot(model)
plot(model, xlim=c(0, 30))
plot(model, xlim=c(0, 30), fct.type="Variogram")
plot(model, xlim=c(-10, 20), fct.type="Variogram", dim=2)
image(model, xlim=c(-10, 20), fct.type="Variogram")
persp(model, xlim=c(-10, 20), fct.type="Variogram")

#############################################################
## Plot of simulation results

## define the locations:
from <- 0
step <- .1 
len <- 50  # nicer if len=100 %ok
## Don't show: 
if(RFoptions()$internal$examples_red){warning("reduced 'len'"); len<-3}
## End(Don't show) 
x1D <- GridTopology(from, step, len)
x2D <- GridTopology(rep(from, 2), rep(step, 2), rep(len, 2))
x3D <- GridTopology(rep(from, 3), rep(step, 3), rep(len, 3))

## 1-dimensional
sim1D <- RFsimulate(model = model, x=x1D, n=6) 
plot(sim1D, nmax=4)

## 2-dimensional
sim2D <- RFsimulate(model = model, x=x2D, n=6) 
plot(sim2D, nmax=4)
plot(sim2D, nmax=4, col=terrain.colors(64),
main="My simulation", xlab="my_xlab")

## 3-dimensional
model <- RMmatern(nu=1.5, var=4, scale=2)
sim3D <- RFsimulate(model = model, x=x3D) 
plot(sim3D, MARGIN=c(2,3), MARGIN.slices=1, n.slices=4)

 
#############################################################
## empirical variogram plots

x <- seq(0, 10, 0.05)
bin <- seq(from=0, by=.2, to=3)

model <- RMexp()
X <- RFsimulate(model, x=cbind(x))
ev1 <- RFvariogram(data=X, bin=bin)
plot(ev1)

model <- RMexp(Aniso = cbind(c(10,0), c(0,1)))
X <- RFsimulate(model, x=cbind(x,x))
ev2 <- RFvariogram(data=X, bin=bin, phi=3)
plot(ev2, model=list(exp = model))

## Don't show: ## Not run: 
##D #############################################################
##D ## plot Fitting results
##D x <- seq(0, 1, len=21)
##D  
##D model <- RMexp(Aniso = cbind(c(10,0), c(0,1)))
##D X <- RFsimulate(model, x=cbind(x,x))
##D fit <- RFfit(~RMexp(Aniso=cbind(c(NA, 0), c( 0, NA))), data=X, fit.nphi = 2,
##D              modus="easygoing")
##D plot(fit)
## End(Not run)## End(Don't show)


#############################################################
## plot Kriging results 
model <- RMwhittle(nu=1.2, scale=2)
n <- 200
x <- runif(n, max=step*len/2) 
y <- runif(n, max=step*len/2) # 200 points in 2 dimensional space
sim <- RFsimulate(model, x=x, y=y)

interpolate <- RFinterpolate(model, x=x2D, data=sim)
plot(interpolate)
plot(interpolate, sim)


#############################################################
## plotting vector-valued results
model <- RMdivfree(RMgauss(), scale=4)
x <- y <- seq(-10,10, 0.5)
simulated <- RFsimulate(model, x=x, y=y, n=1)
plot(simulated)
plot(simulated, select.variables=list(1, 1:3, 4))



#############################################################
## options for the zlim argument
model <- RMdelay(RMstable(alpha=1.9, scale=2), s=c(0, 4)) +
         RMdelay(RMstable(alpha=1.9, scale=2), s=c(4, 0))
simu <- RFsimulate(model, x, y)

plot(simu, zlim=list(data=cbind(c(-6,2), c(-2,1)), var=c(5,6)))
plot(simu, zlim=cbind(c(-6,2), c(-2,1)))
plot(simu, zlim=c(-6,2))
plot(simu, zlim="joint")

## Don't show: 
FinalizeExample()
## End(Don't show)


