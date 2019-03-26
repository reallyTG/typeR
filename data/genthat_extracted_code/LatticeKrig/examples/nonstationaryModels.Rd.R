library(LatticeKrig)


### Name: nonstationaryModels
### Title: Specifying a nonstationary model in alpha
### Aliases: nonstationaryModels

### ** Examples


######################################################
##### This is an extended example showing how to define 
##### spatially varying rho parameter 
#######################################################
# Define a useful predict function. 
#######################################################
  predict.surfaceGrid<- function(object,x){
    interp.surface( object, x)
   }


################################################
##### Nonstationary examples
###############################################
# spatial domain    
sDomain<- rbind( c(-1.2,-1.2),
                 c(1,1))

# we will use this coarse grid to define any 
# surfaces of parameters
# (unrelated to the lattice grids and plotting grid!)
# this is larger than the sDomain to accomodate buffer points
# (with larger ranges when NC is small)
  gridList<- list( x = seq( -3, 3,,50),
                   y = seq( -3, 3,,75) )
  xPoints<- make.surface.grid( gridList)
  fineGrid<- make.surface.grid(
                 list( x = seq(-1, 1, ,45),
                       y = seq(-1, 1, ,60)
                       )
                               )
 
##################################################
### end of setup 
#################################################
# rho increases across the domain as a function of first coordinate. 
  rhoTemp<-  .01 +  10* pnorm( xPoints[,1], mean=.25, sd =.3 )
  rho.object<- as.surface( xPoints, rhoTemp) 
  class( rho.object)<- "surfaceGrid"
     
  LKinfo<- LKrigSetup( sDomain, NC= 4, nlevel = 3,
                 a.wght=4.5, nu=1, rho.object=rho.object)   
# simulate a field from this model
  set.seed(123)
  look<- LKrig.sim( fineGrid, LKinfo)
  image.plot( as.surface( fineGrid, look))
  xline( .25, col="grey30")
# see also 
# temp<- as.surface( fineGrid, look)
# I<- 20
# matplot(temp$x, temp$z, type="l", xlab="x", ylab="GP slice" )
  
######################################################
##### spatially varying alpha parameters 
#######################################################

# the alpha surface at each level will just be the result of 
# bilinear interpolation of values specified on a small grid.
# To keep things identified the alpha weights at 
# any grid location are 
# normalized to sum to 1. 
#
# create a 3 column matrix with  (proportional) alpha weights
# at each grid point 
#
  taper<- pnorm( xPoints[,1], mean = .4, sd=.02)
  alphaTemp<- cbind( taper,
        rep( 1, length( taper)), 
                        1-taper)
# normalize to sum to one                        
  alphaTemp <- alphaTemp/rowSums(alphaTemp)
 
# pack as a list 
# convert from a vector to the image/list format  $x $y $z
# give this object a class so that predict.surfaceGrid is called.
# accumulate these objects in a list 
# (yes this is a "list of lists")
  alphaObject<- list()
  for( k in 1:3){
     hold<- as.surface( xPoints, alphaTemp[,k]) 
     class( hold)<- "surfaceGrid"
     alphaObject<- c( alphaObject, list( hold))
  }
  
# define the 2-d LatticeKrig model
  LKinfo<- LKrigSetup(sDomain, NC = 4, a.wght=4.5,
              alpha = c(1,1,1), nlevel = 3, 
              alphaObject =  alphaObject )
# simulate a field 
 
  set.seed(123)
  look<- LKrig.sim( fineGrid, LKinfo)
  image.plot( as.surface( fineGrid, look))
  
######################################################
##### spatially varying a.wght parameters 
##### See above comments and setup
##### for steps that are the same 
#######################################################
  taper<- pnorm( xPoints[,1] + xPoints[,1],
                    mean = 0, sd=.15)
  a.wghtTemp<- 4.001*taper +  10*(1-taper)
# pack up as a list 
# convert from a vector to the image/list format  $x $y $z
# give this object a class so that predict.surfaceGrid is called.
# accumulate these objects in a list (yes this is 
# a "list of lists")
 
     a.wghtObjectA <- as.surface( xPoints, a.wghtTemp) 
     class( a.wghtObjectA)<- "surfaceGrid"
     

# define the 2-d LatticeKrig model
 
  LKinfo2<- LKrigSetup(sDomain, NC = 5, NC.buffer=0, 
              alpha = c(1, .5, .125), nlevel = 3, 
              a.wghtObject =  a.wghtObjectA)
              
  set.seed(123)            
  look<- LKrig.sim( fineGrid, LKinfo2)
  image.plot( as.surface( fineGrid, look))
##############################################
###### 1-d example
#############################################
  xCoarse1<- seq( -.5,1.5,, 40)
  y<-  pnorm( xCoarse1, mean=.4, sd=.05)*5 + 2.2 
  a.wghtObject<- Tps(xCoarse1, y, lambda=0)
  alphaTemp<-c(.5, .3, .2)
  LKinfoTEST<- LKrigSetup( rbind(0,1), NC=10,
                          LKGeometry="LKInterval",
                          nlevel=3, alpha=alphaTemp,
                          a.wghtObject = a.wghtObject,
                          NC.buffer=2
                          ) 
  xFine1<- cbind(seq( 0,1,length.out= 200))
  set.seed( 123)
  look<- LKrig.sim( xFine1, LKinfoTEST, M=5)
  matplot( xFine1, look, type="l", lty=1)
##################################################
######## Anisotropy in a.wght
##################################################
  a.wghtM2<- c( rbind( c(  0,   0, -1.5),
                       c(-.5, 4.5,  -.5),
                       c(-1.5,  0,    0)
                   )
                   ) 
  
  LKinfo3<- LKrigSetup(sDomain, NC = 5, 
      a.wght= list( a.wghtM2), 
              alpha = c(1,.5, .125), nlevel = 3, 
              a.wghtObject =  NULL, normalize=TRUE )
              
  
  set.seed(123)            
  look<- LKrig.sim( fineGrid, LKinfo3)
  image.plot( as.surface( fineGrid, look))
                  



