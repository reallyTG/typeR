library(RFOC)


### Name: BOXarrows3D
### Title: Create a 3D Arrow structure
### Aliases: BOXarrows3D
### Keywords: aplot

### ** Examples

## Not run: 
##D #### animate 10 random arrow vectors
##D 
##D 
##D  L   = list(x1 = runif(10, min=-2, max=2),
##D     y1 = runif(10, min=-2, max=2),
##D     z1=runif(10, min=-4, max=4),
##D     x2 = runif(10, min=-2, max=2),
##D     y2 = runif(10, min=-2, max=2),
##D     z2=runif(10, min=-4, max=4)
##D     )
##D   headlen = .3
##D   len = .7
##D   basethick = 0.05
##D   headlip = .02
##D   aglyph = Z3Darrow(len = len , basethick =basethick , headlen =headlen , headlip=headlip )
##D 
##D   r1 = 8
##D   theta = seq(from=0, to=2*360, length=200)
##D   mex = r1*cos(theta*pi/180)
##D   mey = r1*sin(theta*pi/180)
##D   mez = seq(from=r1, to =0 , length=length(mex))
##D   ##  mez=rep(r1, length=length(mex))
##D   
##D   angz = atan2(mey, mex)*180/pi
##D   angx = atan2(sqrt(mex^2+mey^2), mez)*180/pi
##D   pal=c("red", "blue", "green")
##D 
##D ##  aglyph = gblock
##D 
##D   for(j in 1:length(angz))
##D     {
##D       Rview  =    ROTZ(angz[j])##D 
##D       plot(c(-4,4), c(-4,4), type='n', asp=1); grid()
##D       
##D       BOXarrows3D(L$x1,L$y1,L$z1, L$x2,L$y2,L$z2,  aglyph=aglyph,  Rview=Rview, col=pal)
##D       
##D       Sys.sleep(.1)
##D     }
## End(Not run)





