library(fields)


### Name: plot.Krig
### Title: Diagnostic and summary plots of a Kriging, spatialProcess or
###   spline object.
### Aliases: plot.Krig plot.sreg
### Keywords: spatial

### ** Examples


data( ozone2)
x<- ozone2$lon.lat
y<- ozone2$y[16,]
fit1<-Krig(x,y, theta=200)  
# fitting a surface to ozone  
# measurements 
set.panel( 2,2)
plot(fit1)

fit2<-spatialProcess(x,y)  
# fitting a spatial process model to ozone  
# measurements 
# Although an example does not make too much sense for only 20 observations!
set.panel( 2,2)
plot(fit2)

# fit rat data
fit3<-sreg(rat.diet$t,rat.diet$con)
set.panel(2,2)
plot(fit3)       

set.panel(1,1) # reset graphics window. 




