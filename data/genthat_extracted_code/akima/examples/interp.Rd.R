library(akima)


### Name: interp
### Title: Gridded Bivariate Interpolation for Irregular Data
### Aliases: interp
### Keywords: dplot

### ** Examples

data(akima)
plot(y ~ x, data = akima, main = "akima example data")
with(akima, text(x, y, formatC(z,dig=2), adj = -0.1))

## linear interpolation
akima.li <- interp(akima$x, akima$y, akima$z)
li.zmin <- min(akima.li$z,na.rm=TRUE)
li.zmax <- max(akima.li$z,na.rm=TRUE)
breaks <- pretty(c(li.zmin,li.zmax),10)
colors <- heat.colors(length(breaks)-1)
with(akima.li, image  (x,y,z, breaks=breaks, col=colors))
with(akima.li,contour(x,y,z, levels=breaks, add=TRUE))
points (akima, pch = 3)

## increase smoothness (using finer grid):
akima.smooth <-
    with(akima, interp(x, y, z, nx=100, ny=100))
si.zmin <- min(akima.smooth$z,na.rm=TRUE)
si.zmax <- max(akima.smooth$z,na.rm=TRUE)
breaks <- pretty(c(si.zmin,si.zmax),10)
colors <- heat.colors(length(breaks)-1)

image  (akima.smooth, main = "interp(<akima data>, *) on finer grid",
        breaks=breaks, col=colors)
contour(akima.smooth, add = TRUE, levels=breaks, col = "thistle")
points(akima, pch = 3, cex = 2, col = "blue")

## use triangulation package to show underlying triangulation:
## Not run: 
##D if(library(tripack, logical.return=TRUE))
##D    plot(tri.mesh(akima), add=TRUE, lty="dashed")
## End(Not run)
## use only 15 points (interpolation only within convex hull!)
akima.part <- with(akima, interp(x[1:15], y[1:15], z[1:15]))
p.zmin <- min(akima.part$z,na.rm=TRUE)
p.zmax <- max(akima.part$z,na.rm=TRUE)
breaks <- pretty(c(p.zmin,p.zmax),10)
colors <- heat.colors(length(breaks)-1)

image(akima.part, breaks=breaks, col=colors)
title("interp() on subset of only 15 points")
contour(akima.part, levels=breaks, add=TRUE)
points(akima$x[1:15],akima$y[1:15], col = "blue")

## spline interpolation
akima.spl <- with(akima, interp(x, y, z, nx=100, ny=100, linear=FALSE))

contour(akima.spl, main = "smooth  interp(*, linear = FALSE)")
points(akima)

full.pal <- function(n) hcl(h = seq(340, 20, length = n))
cool.pal <- function(n) hcl(h = seq(120, 0, length = n) + 150)
warm.pal <- function(n) hcl(h = seq(120, 0, length = n) - 30)

filled.contour(akima.spl, color.palette = full.pal,
        plot.axes = { axis(1); axis(2);
                      title("smooth  interp(*, linear = FALSE)");
                      points(akima, pch = 3, col= hcl(c=100, l = 20))})
## no extrapolation!

## Not run: 
##D     ## interp can handle spatial point dataframes created by the sp package:
##D     library(sp)
##D     data(meuse)
##D     coordinates(meuse) <- ~x+y
##D     ## argument z has to be named, y has to be omitted!
##D     z <- interp(meuse,z="zinc",nx=100,ny=150)
##D     spplot(z,"zinc")
##D     z <- interp(meuse,z="zinc",nx=100,ny=150,linear=FALSE)
##D     spplot(z,"zinc")
## End(Not run)

## Not run: 
##D ### An example demonstrating the problems that occur for rectangular
##D ### gridded data.
##D ###
##D require(tripack)
##D ### Create irregularly spaced sample data on even values of x and y
##D ### (the "14" makes it irregular spacing).
##D x   <- c(seq(2,10,2),14)
##D nx  <- length(x)
##D y   <- c(seq(2,10,2),14)
##D ny  <- length(y)
##D nxy <- nx*ny
##D xy  <- expand.grid(x,y)
##D colnames(xy) <- c("x","y")
##D ### prepare a dataframe for interp
##D df  <- cbind(xy,z=rnorm(nxy))
##D ### and a matrix for bicubic and bilinear
##D z   <- matrix(df$z,nx,ny)
##D 
##D old.par <- par(mfrow=c(2,2))
##D ### First: bicubic spline interpolation:
##D ### This is Akimas bicubic spline implementation for regular gridded
##D ### data:
##D iRbic <- bicubic.grid(x,y,z,nx=250,ny=250)
##D ### Note that this interpolation tends to extreme values in large cells.
##D ### Therefore zmin and zmax are taken from here to generate the same
##D ### color scheme for the next plots.
##D zmin <- min(iRbic$z, na.rm=TRUE)
##D zmax <- max(iRbic$z, na.rm=TRUE)
##D breaks <- pretty(c(zmin,zmax),10)
##D colors <- heat.colors(length(breaks)-1)
##D image(iRbic,breaks=breaks,col = colors)
##D contour(iRbic,col="black",levels=breaks,add=TRUE)
##D points(xy$x,xy$y)
##D title(main="bicubic interpolation",
##D       xlab="bcubic.grid(...)",
##D       sub="Akimas regular grid version, ACM 760")
##D 
##D ### Now Akima splines with accurracy of bicubic polynomial
##D ### for irregular gridded data:
##D iRspl <- with(df,interp(x,y,z,linear=FALSE,nx=250,ny=250))
##D ### Note that the triangulation is created by adding small amounts
##D ### of jitter to the coordinates, resulting in an unique triangulation.
##D ### This jitter is not randomly choosen to get reproducable results.
##D ### tri.mesh() from package tripack uses the same code and so produces the
##D ### same triangulation.
##D image(iRspl,breaks=breaks,col = colors)
##D contour(iRspl,col="black",levels=breaks,add=TRUE)
##D plot(tri.mesh(xy$x,xy$y),col="white",add=TRUE)
##D title(main="bicubic* interpolation",
##D       xlab="interp(...,linear=FALSE)",
##D       ylab="*: accuracy of bicubic polynomial"
##D       sub="Akimas irregular grid version, ACM 761")
##D 
##D ### Just for comparison an implementation of bilinear interpolation,
##D ### only applicable to regular gridded data:
##D iRbil <- bilinear.grid(x,y,z,nx=250,ny=250)
##D ### Note the lack of differentiability at grid cell borders.
##D image(iRbil,breaks=breaks,col = colors)
##D contour(iRbil,col="black",levels=breaks,add=TRUE)
##D points(xy$x,xy$y)
##D title(main="bilinear interpolation",
##D       xlab="bilinear.grid(...)",
##D       sub="only works for regular grid")
##D 
##D ### Linear interpolation using the same triangulation as
##D ### Akima bicubic splines for irregular gridded data.
##D iRlin <- with(df,interp(x,y,z,linear=TRUE,nx=250,ny=250))
##D ### Note how the triangulation influences the interpolation.
##D ### For this rectangular gridded dataset the triangulation
##D ### in each rectangle is arbitraryly choosen from two possible
##D ### solutions, hence the interpolation would change drastically
##D ### when the triangulation changes. For this reason interp()
##D ### is not meant for regular (rectangular) gridded data!
##D image(iRlin,breaks=breaks,col = colors)
##D contour(iRlin,col="black",levels=breaks,add=TRUE)
##D plot(tri.mesh(xy$x,xy$y),col="white",add=TRUE)
##D title(main="linear interpolation",
##D       xlab="interp(...,linear=TRUE)",
##D       sub="same triangulation as Akima irregular grid")
##D 
##D ### And now four times Akima 761 with random jitter for
##D ### triangulation correction, note that now interp() and tri.mesh()
##D ### need the same random seed to produce identical triangulations!
##D for(i in 1:4){
##D     set.seed(42+i)
##D     iRspl <- with(df,interp(x,y,z,linear=FALSE,nx=250,ny=250,jitter.random=TRUE))
##D     image(iRspl,breaks=breaks,col = colors)
##D     contour(iRspl,col="black",levels=breaks,add=TRUE)
##D     set.seed(42+i)
##D     plot(tri.mesh(xy$x,xy$y,jitter.random=TRUE),col="white",add=TRUE)
##D     title(main="bicubic* interpolation",
##D           xlab="interp(...,linear=FALSE)",
##D           ylab="random jitter added",
##D           sub="Akimas irregular grid version, ACM 761")
##D }
##D par(old.par)
##D 
## End(Not run)
### Use all datasets from Franke, 1979:
data(franke)
for(i in 1:5)
    for(j in 1:3){
        FR <- franke.data(i,j,franke)
        IL <- with(FR, interp(x,y,z,linear=FALSE))
        image(IL)
        contour(IL,add=TRUE)
        with(FR,points(x,y))
    }



