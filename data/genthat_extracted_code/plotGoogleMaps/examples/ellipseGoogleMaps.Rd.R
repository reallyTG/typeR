library(plotGoogleMaps)


### Name: ellipseGoogleMaps
### Title: Create plot of ellipses from spatial points data frame on Google
###   Maps, by using three attributes: semi-major axis, semi-minor axis,
###   and orientation in degrees.
### Aliases: ellipseGoogleMaps

### ** Examples

# Data preparation
    ell<- data.frame(E=c(7456263,7456489,7456305),
    N=c(4954146,4952978,4952695),A=c( 2.96,4.55,7.10),
    B=c(2.35,2.11,2.29),teta=c(28.35242,41.04491,38.47216))
    
    coordinates(ell) <- ~E+N
    proj4string(ell) <- CRS("+proj=tmerc +lat_0=0 +lon_0=21 +k=0.9999 
        +x_0=7500000 +y_0=0 +ellps=bessel 
        +towgs84=574.027,170.175,401.545,4.88786,-0.66524,-13.24673,0.99999311067 
        +units=m")
    
    m<-ellipseGoogleMaps(ell,mapTypeId='ROADMAP')




