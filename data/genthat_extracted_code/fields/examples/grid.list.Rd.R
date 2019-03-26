library(fields)


### Name: grid list
### Title: Some simple functions for working with gridded data and the grid
###   format (grid.list) used in fields.
### Aliases: 'grid list' grid.list fields.x.to.grid parse.grid.list
###   fields.convert.grid discretize.image make.surface.grid unrollZGrid
### Keywords: misc

### ** Examples


#Given below are some examples of grid.list objects and the results  
#when they are used with make.surface.grid. Note that  
#make.surface.grid returns a matrix that retains the grid.list  
#information as an attribute. 

grid.l<- list( 1:3, 2:5) 
make.surface.grid(grid.l)

  
grid.l <- list( 1:3, 10, 1:3) 
make.surface.grid(grid.l) 

#The next  example shows how the grid.list can be used to  
#control surface plotting and evaluation of an estimated function. 
# first create a test function  

set.seed( 124)

X<- 2*cbind( runif(30), runif(30), runif(30)) -1
  
dimnames( X)<- list(NULL, c("X1","X2","X3")) 
y<- X[,1]**2 + X[,2]**2 + exp(X[,3])   

# fit an  interpolating thin plate spline  
out<- Tps( X,y) 

grid.l<- list( X1= seq( 0,1,,20), X2=.5, X3=seq(0,1,,25)) 
surface( out, grid.list=grid.l) 
#  surface plot based on a 20X25 grid in X1 an X3  
#                       over the square [0,2] and [0,2]   
#                       holding X2 equal to 1.0. 
#


# test of discretize to make sure points on boundaries are counted right
set.seed(123)
x<- matrix( runif(200), 100,2)
look<- discretize.image( x, m=2,n=2)
xc<- seq(min(x[,1]), max(x[,1]),,5)
xc<- xc[2:4]
yc<- seq(min(x[,2]), max(x[,2]),,5)
yc<- yc[2:4]
grid <-  list( x= xc, y= yc)
look2<- discretize.image( x, m=2,n=2)

table( look$index )
table( look2$index )

# indicator image of discretized locations
look<- discretize.image( RMprecip$x, m=15, n=15)
image.plot( look$grid$x, look$grid$y,look$hist )  
# actual locations
points( RMprecip$x,col="magenta", pch=".") 






