library(fields)


### Name: Covariance functions
### Title: Exponential family, radial basis functions,cubic spline,
###   compactly supported Wendland family and stationary covariances.
### Aliases: Exp.cov Exp.simple.cov Rad.cov Rad.simple.cov stationary.cov
###   stationary.taper.cov wendland.cov cubic.cov
### Keywords: spatial

### ** Examples

# exponential covariance matrix ( marginal variance =1) for the ozone
#locations 
out<- Exp.cov( ChicagoO3$x, theta=100)

# out is a 20X20 matrix

out2<- Exp.cov( ChicagoO3$x[6:20,],ChicagoO3$x[1:2,], theta=100)
# out2 is 15X2 matrix 

# Kriging fit where the nugget variance is found by GCV 
# Matern covariance shape with range of 100.
# 

fit<- Krig( ChicagoO3$x, ChicagoO3$y, Covariance="Matern", theta=100,smoothness=2)

data( ozone2)
x<- ozone2$lon.lat
y<- ozone2$y[16,]
# Omit the NAs
good<- !is.na( y)
x<- x[good,]
y<- y[good]


# example of calling the taper version directly 
# Note that default covariance is exponential and default taper is 
# Wendland (k=2).

stationary.taper.cov( x[1:3,],x[1:10,] , theta=1.5, Taper.args= list(k=2,theta=2.0,
                       dimension=2) )-> temp
# temp is now a tapered 3X10 cross covariance matrix in sparse format. 

 is.spam( temp)  # evaluates to TRUE

# should be identical to
# the direct matrix product

 temp2<- Exp.cov( x[1:3,],x[1:10,], theta=1.5) * Wendland(rdist(x[1:3,],x[1:10,]), 
                      theta= 2.0, k=2, dimension=2)
 test.for.zero(  as.matrix(temp), temp2)

# Testing that the "V" option works as advertized ...
x1<- x[1:20,]
x2<- x[1:10,]

V<- matrix( c(2,1,0,4), 2,2)
Vi<- solve( V)

u1<- t(Vi%*% t(x1))
u2<- t(Vi%*% t(x2))

look<- exp(-1*rdist(u1,u2))
look2<- stationary.cov( x1,x2, V= V)
test.for.zero( look, look2)


# Here is an example of how the cross covariance multiply works
# and lots of options on the arguments


 Ctest<- rnorm(10)
 
 temp<- stationary.cov( x,x[1:10,], C= Ctest, 
        Covariance= "Wendland", 
            k=2, dimension=2, theta=1.5 )

# do multiply explicitly

 temp2<- stationary.cov( x,x[1:10,],
        Covariance= "Wendland",
            k=2, dimension=2, theta=1.5 )%*% Ctest

 test.for.zero( temp, temp2)


# use the tapered stationary version 
# cov.args is part of the argument list passed to stationary.taper.cov
# within Krig. 
# This example needs the spam package.
# 

## Not run: 
##D 
##D Krig(x,y, cov.function = "stationary.taper.cov", theta=1.5,
##D       cov.args= list(Taper.args= list(k=2, dimension=2,theta=2.0) )
##D            ) -> out2 
##D # NOTE: Wendland is the default taper here. 
## End(Not run)

# BTW  this is very similar to 
## Not run: 
##D  Krig(x,y, theta= 1.5)-> out
## End(Not run)






