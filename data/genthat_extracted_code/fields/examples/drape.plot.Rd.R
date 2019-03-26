library(fields)


### Name: drape.plot
### Title: Perspective plot draped with colors in the facets.
### Aliases: drape.color drape.plot
### Keywords: hplot

### ** Examples


# an obvious choice:
# Dr. R's favorite New  Zealand Volcano!
data( volcano)
M<- nrow( volcano)
N<- ncol( volcano)
x<- seq( 0,1,,M)
y<- seq( 0,1,,N)

pm<- drape.plot( x,y,volcano, col=terrain.colors(128)) 

# use different range for color scale and persp plot
# setting of border omits the mesh lines

 drape.plot( x,y,volcano, col=terrain.colors(128),zlim=c(0,300),
                     zlim2=c( 120,165), border=NA)

# note tranparent color for facets outside the zlim2 range


#The projection has been saved in pm
# add a point marking the summit
max( volcano)-> zsummit
ix<- row( volcano)[volcano==zsummit]
iy<- col( volcano)[volcano==zsummit]
trans3d( x[ix], y[iy],zsummit,pm)-> uv
points( uv, col="magenta", pch="+", cex=2)

# overlay volcano wireframe with gradient in x direction. 

dz<- ( 
     volcano[1:(M-1), 1:(N-1)] - volcano[2:(M), 1:(N-1)] +
     volcano[1:(M-1), 2:(N)] - volcano[2:(M), 2:(N)]  
         )/2

# convert dz to a color scale:
  zlim<- range( c( dz), na.rm=TRUE)
  zcol<-drape.color( dz, zlim =zlim, col = tim.colors(64) )$color.index

# wireframe with these colors 
  persp( volcano, col=zcol, theta=30, phi=20)

# add legend using image.plot function 
  image.plot( zlim=zlim, legend.only =TRUE, horizontal =TRUE, col= tim.colors(64))
 




