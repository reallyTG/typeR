library(orientlib)


### Name: boat3d
### Title: Draw boat glyphs for orientation data
### Aliases: boat3d
### Keywords: hplot dynamic

### ** Examples

x <- eulerzyx(psi=c(0,pi/4,0,0), theta=c(0,0,pi/4,0), phi=c(0,0,0,pi/4))

# Need a 3D renderer; assume scatterplot3d, but others could be used

s <- boat3d(x, 0:3, axes = FALSE, graphics = 'scatterplot3d')
text(s$xyz.convert(0:3, rep(-0.5,4), rep(-0.5,4)), 
     label = c('Id','z','y','x'))
         
## Not run: 
##D 
##D # if the rgl package is loaded, this code will work
##D 
##D boat3d(x, 0:3, axes = FALSE, graphics = 'rgl')
##D rgl.bbox(xat=0:3,xlab=c('Id','z','y','x'),yat=1,zat=1,color='grey')  
## End(Not run)



