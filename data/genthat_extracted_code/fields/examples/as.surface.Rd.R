library(fields)


### Name: as.surface
### Title: Creates an "surface" object from grid values.
### Aliases: as.surface
### Keywords: manip

### ** Examples

 

# Make a perspective of the surface Z= X**2 -Y**2 
# Do this by evaluating quadratic function on a 25 X 25 grid
  
grid.l<-list( abcissa= seq( -2,2,,15), ordinate= seq( -2,2,,20)) 
xg<-make.surface.grid( grid.l)
# xg is a 300X2 matrix that has all pairs of X and Y grid values 
z<- xg[,1]**2 - xg[,2]**2  
# now fold z in the matrix format needed for persp 
out.p<-as.surface( xg, z) 
persp( out.p) 
# also try  plot( out.p) to see the default plot for a surface object 



