library(GEOmap)


### Name: faultdip
### Title: Show Fault dip
### Aliases: faultdip
### Keywords: aplot

### ** Examples


ff=list()
ff$x=c(-4.850,-4.700,-3.934,-2.528, 0.603, 2.647, 3.861, 2.626)
ff$y=c(-4.045,-2.087,-0.710, 0.172, 1.291, 2.087,-0.753,-4.131)

G =getsplineG(ff$x, ff$y, kdiv=20)
g = PointsAlong(G$x, G$y, N=5)


plot(c(-5,5), c(-5,5), asp=1, type='n' )
lines(G)

angs = 180*atan(g$rot$sn/g$rot$cs)/pi
faultdip(g$x , g$y , rot=angs, h=.5, lab='')





