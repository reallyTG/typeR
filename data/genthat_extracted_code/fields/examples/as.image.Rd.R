library(fields)


### Name: as.image
### Title: Creates image from irregular x,y,z
### Aliases: as.image
### Keywords: manip

### ** Examples

# convert precip data to 50X50 image  
look<- as.image( RMprecip$y, x= RMprecip$x, nx=50, ny=50)
image.plot( look) 

# reduced grid extent compared to the domain
gridList<- list( x = seq(-105,-101,length.out=10),
                 y = seq(  38, 42,length.out=10) )
look2<- as.image( RMprecip$y, x= RMprecip$x,grid=gridList)
image.plot( look2) 

# number of obs in each cell -- in this case equal to the 
# aggregated weights because each obs had equal weight in the call

image.plot( look$x ,look$y, look$weights, col=terrain.colors(50)) 
# hot spot is around Denver



