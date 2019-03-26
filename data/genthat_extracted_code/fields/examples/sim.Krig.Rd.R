library(fields)


### Name: sim.spatialProcess
### Title: Conditional simulation of a spatial process
### Aliases: sim.Krig sim.spatialProcess sim.Krig.approx sim.mKrig.approx
###   sim.fastTps.approx
### Keywords: spatial

### ** Examples


## Not run: 
##D # conditional simulation with covariates
##D # colorado climate example
##D   data(COmonthlyMet)
##D   fit1E<- spatialProcess(CO.loc,CO.tmin.MAM.climate, Z=CO.elev   )
##D # conditional simulation at missing data
##D   good<- !is.na(CO.tmin.MAM.climate ) 
##D   infill<- sim.spatialProcess( fit1E, xp=CO.loc[!good,], 
##D                 Z= CO.elev[!good], M= 10)
##D # get an elevation grid  ... NGRID<- 50 gives a nicer image but takes longer 
##D  NGRID <- 25  
##D  # get elevations on a grid  
##D    COGrid<- list( x=seq( -109.5, -101, ,NGRID), y= seq(39, 41.5,,NGRID) )
##D    COGridPoints<- make.surface.grid( COGrid)
##D  # elevations are a bilinear interpolation from the 4km
##D  # Rocky Mountain elevation fields data set.   
##D    data( RMelevation)
##D    COElevGrid<- interp.surface( RMelevation, COGridPoints )
##D # NOTE call to sim.Krig treats the grid points as just a matrix
##D # of locations the plot has to "reshape" these into a grid 
##D # to use with image.plot 
##D    SEout<- sim.spatialProcess( fit1E, xp=COGridPoints,  Z= COElevGrid, M= 30)
##D # for just the smooth surface in lon/lat
##D #  SEout<- sim.spatialProcess( fit1E, xp=COGridPoints,  drop.Z=TRUE, M= 30)
##D # in practice M should be larger to reduce Monte Carlo error.      
##D    surSE<- apply( SEout, 2, sd )
##D    image.plot( as.surface( COGridPoints, surSE)) 
##D    points( fit1E$x, col="magenta", pch=16) 
##D    
## End(Not run)

data( ozone2)
set.seed( 399)
# fit to day 16 from Midwest ozone data set.
  out<- Krig( ozone2$lon.lat, ozone2$y[16,], Covariance="Matern", 
            theta=1.0,smoothness=1.0, na.rm=TRUE)

# NOTE theta =1.0 is not the best choice but 
# allows the sim.rf circulant embedding algorithm to 
# work without increasing the domain.

#six missing data locations
 xp<-  ozone2$lon.lat[ is.na(ozone2$y[16,]),]

# 5 draws from process at xp given the data 
# this is an exact calculation
 sim.Krig( out,xp, M=5)-> sim.out

# Compare: stats(sim.out)[3,] to  Exact: predictSE( out, xp)
# simulations on a grid
# NOTE this is approximate due to the bilinear interpolation
# for simulating the unconditional random field. 
# also more  grids points ( nx and  ny) should be used  

sim.Krig.approx(out,M=5, nx=20,ny=20)-> sim.out

# take a look at the ensemble members. 

predictSurface( out, grid= list( x=sim.out$x, y=sim.out$y))-> look

zr<- c( 40, 200)

set.panel( 3,2)
image.plot( look, zlim=zr)
title("mean surface")
for ( k in 1:5){
image( sim.out$x, sim.out$y, sim.out$z[,,k], col=tim.colors(), zlim =zr)
}



## Not run: 
##D data( ozone2)
##D y<- ozone2$y[16,]
##D good<- !is.na( y)
##D y<-y[good]
##D x<- ozone2$lon.lat[good,]
##D O3.fit<- mKrig( x,y, Covariance="Matern", theta=.5,smoothness=1.0, lambda= .01 )
##D set.seed(122)
##D O3.sim<- sim.mKrig.approx( O3.fit, nx=100, ny=100, gridRefinement=3, M=5 )
##D set.panel(3,2)
##D surface( O3.fit)
##D for ( k in 1:5){
##D image.plot( as.surface( O3.sim$predictionPoints, O3.sim$Ensemble[,k]) )
##D }
##D # conditional simulation at missing data
##D xMissing<- ozone2$lon.lat[!good,]
##D O3.sim2<- sim.mKrig.approx( O3.fit, xMissing, nx=80, ny=80,
##D                             gridRefinement=3, M=4 )
## End(Not run)
## Not run: 
##D #An example for fastTps:
##D   data(ozone2)
##D   y<- ozone2$y[16,]
##D   good<- !is.na( y)
##D   y<-y[good]
##D   x<- ozone2$lon.lat[good,]
##D   O3FitMLE<- fastTpsMLE( x,y, theta=1.5 )
##D   O3Obj<- fastTps( x,y, theta=1.5, lambda=O3FitMLE$lambda.MLE)
##D # creating a quick grid list based on ranges of locations
##D   grid.list<- fields.x.to.grid( O3Obj$x, nx=100, ny=100)
##D   O3Sim<- sim.fastTps.approx( O3Obj,predictionPointsList=grid.list,M=5)
##D # controlling the grids
##D   xR<- range( x[,1], na.rm=TRUE)
##D   yR<- range( x[,2], na.rm=TRUE)
##D   simulationGridList<- list( x= seq(xR[1],xR[2],,400), y= seq( yR[1],yR[2], ,400))
##D # very fine localized prediction grid
##D     O3GridList<- list( x= seq( -90.5,-88.5,,200), y= seq( 38,40,,200))
##D     O3Sim<- sim.fastTps.approx( O3Obj, M=5, predictionPointsList=O3GridList,
##D                   simulationGridList = simulationGridList)
##D # check 
##D  plot( O3Obj$x)
##D  US( add=TRUE)
##D  image.plot( as.surface( O3GridList,O3Sim$Ensemble[,1] ), add=TRUE)
##D  points( O3Obj$x, pch=16, col="magenta")
## End(Not run)



