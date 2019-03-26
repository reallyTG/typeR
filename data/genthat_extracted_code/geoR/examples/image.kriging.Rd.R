library(geoR)


### Name: image.kriging
### Title: Image or Perspective Plot with Kriging Results
### Aliases: image.kriging contour.kriging persp.kriging
###   .prepare.graph.kriging plot.1d
### Keywords: spatial dplot

### ** Examples

loci <- expand.grid(seq(0,1,l=51), seq(0,1,l=51))
kc <- krige.conv(s100, loc=loci,
                 krige=krige.control(cov.pars=c(1, .25)))
image(kc)
contour(kc)
image(kc)
contour(kc, add=TRUE, nlev=21)
persp(kc, theta=20, phi=20)
contour(kc, filled=TRUE)
contour(kc, filled=TRUE, color=terrain.colors)
contour(kc, filled=TRUE, col=gray(seq(1,0,l=21)))
# adding data locations
image(kc, coords.data=s100$coords)
contour(kc,filled=TRUE,coords.data=s100$coords,color=terrain.colors)
#
# now dealing with borders
#
bor <- matrix(c(.4,.1,.3,.9,.9,.7,.9,.7,.3,.2,.5,.8),
              ncol=2)
# plotting just inside borders
image(kc, borders=bor)
contour(kc, borders=bor)
image(kc, borders=bor)
contour(kc, borders=bor, add=TRUE)
contour(kc, borders=bor, filled=TRUE, color=terrain.colors)
# kriging just inside borders
kc1 <- krige.conv(s100, loc=loci,
                 krige=krige.control(cov.pars=c(1, .25)),
                 borders=bor)
image(kc1)
contour(kc1)
# avoiding the borders 
image(kc1, borders=NULL)
contour(kc1, borders=NULL)

op <- par(no.readonly = TRUE)
par(mfrow=c(1,2), mar=c(3,3,0,0), mgp=c(1.5, .8,0))
image(kc)
image(kc, val=sqrt(kc$krige.var))

# different ways to add the legends and pass arguments:
image(kc, ylim=c(-0.2, 1), x.leg=c(0,1), y.leg=c(-0.2, -0.1))
image(kc, val=kc$krige.var, ylim=c(-0.2, 1))
legend.krige(y.leg=c(-0.2,-0.1), x.leg=c(0,1), val=sqrt(kc$krige.var))

image(kc, ylim=c(-0.2, 1), x.leg=c(0,1), y.leg=c(-0.2, -0.1), cex=1.5)
image(kc, ylim=c(-0.2, 1), x.leg=c(0,1), y.leg=c(-0.2, -0.1), offset.leg=0.5)

image(kc, xlim=c(0, 1.2))
legend.krige(x.leg=c(1.05,1.1), y.leg=c(0,1), kc$pred, vert=TRUE)
image(kc, xlim=c(0, 1.2))
legend.krige(x.leg=c(1.05,1.1), y.leg=c(0,1),kc$pred, vert=TRUE, off=1.5, cex=1.5)

par(op)



