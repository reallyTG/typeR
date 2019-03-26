library(fields)


### Name: Wendland
### Title: Wendland family of covariance functions and supporting numerical
###   functions
### Aliases: Wendland Wendland.beta Wendland2.2 fields.D fields.pochdown
###   fields.pochup wendland.eval
### Keywords: spatial

### ** Examples


dt<- seq( 0,1.5,, 200)

y<- Wendland( dt, k=2, dimension=2)

plot( dt, y, type="l")

# should agree with 

y.test<- Wendland2.2( dt)
points( dt, y.test)

# second derivative
plot( dt, Wendland( dt, k=4, dimension=2, derivative=2), type="l")

# a radial basis function using the Wendland  the  "knot" is at (.25,.25)
gl<- list( x= seq( -1,1,,60), y = seq( -1,1,,60) )

bigD<- rdist( make.surface.grid( gl), matrix( c(.25,.25), nrow=1))
RBF<- matrix(Wendland( bigD, k=2, dimension=2), 60,60)

# perspective with some useful settings for shading.
persp( gl$x, gl$y, RBF, theta=30, phi=20, shade=.3, border=NA, col="grey90")





