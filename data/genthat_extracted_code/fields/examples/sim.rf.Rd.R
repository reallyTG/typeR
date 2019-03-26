library(fields)


### Name: sim.rf
### Title: Simulates a Stationary Gaussian random field
### Aliases: sim.rf
### Keywords: spatial

### ** Examples

#Simulate a Gaussian random field with an exponential covariance function,  
#range parameter = 2.0 and the domain is  [0,5]X [0,5] evaluating the 
#field at a 100X100 grid.  
grid<- list( x= seq( 0,5,,100), y= seq(0,5,,100)) 
obj<-Exp.image.cov( grid=grid, theta=.5, setup=TRUE)
look<- sim.rf( obj)
# Now simulate another ... 
look2<- sim.rf( obj)

# Suppose one requires an exponential, range = 2
# but marginal variance = 10 ( rho in fields notation)
look3<- sqrt( 10)*  sim.rf( obj)

# take a look at first two  
set.panel(2,1)
 image.plot( grid$x, grid$y, look) 
 title("simulated gaussian fields")
 image.plot( grid$x, grid$y, look2) 
 title("another realization ...")



