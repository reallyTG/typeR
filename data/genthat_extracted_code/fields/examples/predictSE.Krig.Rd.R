library(fields)


### Name: predictSE
### Title: Standard errors of predictions for Krig spatial process estimate
### Aliases: predictSE predictSE.Krig predictSE.mKrig predictSEUsingKrigA
### Keywords: spatial

### ** Examples

# 
# Note: in these examples predictSE will default to predictSE.Krig using 
# a Krig object  

  fit<- Krig(ChicagoO3$x,ChicagoO3$y,cov.function="Exp.cov", theta=10)    # Krig fit 
  predictSE.Krig(fit)      # std errors of predictions at obs.

# make a  grid of X's  
  xg<-make.surface.grid( 
  list(East.West=seq(-27,34,,20),North.South=seq(-20,35,,20)))     
  out<- predictSE(fit,xg)   # std errors of predictions 

#at the grid points out is a vector of length 400 
#reshape the grid points into a 20X20 matrix etc.  

   out.p<-as.surface( xg, out) 
   surface( out.p, type="C") 

# this is equivalent to  the single step function  
# (but default is not to extrapolation beyond data
# out<- predictSurfaceSE( fit) 
# image.plot( out) 






