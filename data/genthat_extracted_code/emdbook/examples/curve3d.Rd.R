library(emdbook)


### Name: curve3d
### Title: Plot a 3D surface representing a 2D curve
### Aliases: curve3d
### Keywords: hplot

### ** Examples

curve3d(cos(2*pi*x)+sin(2*pi*y/3),
 from=c(0,0),to=c(1,1))
x <- 1
y <- 3
curve3d(cos(2*pi*x)+sin(2*pi*y/3),
 from=c(0,0),to=c(1,1),sys3d="wireframe")
curve3d(x*cos(2*pi*a/x)+sin(2*pi*b/y),
 from=c(0,0),to=c(1,1),sys3d="wireframe",
varnames=c("a","b"))  ## identical
op <- par(mfrow=c(2,2))
curve3d(cos(2*pi*x)+sin(2*pi*y/3),
 from=c(0,0),to=c(1,1),sys3d="image")
curve3d(x*cos(2*pi*a/x)+sin(2*pi*b/y),
 from=c(0,0),to=c(1,1),sys3d="image",
varnames=c("a","b"))  ## identical
x <- 4
curve3d(cos(2*pi*a/x)+y*sin(2*pi*b/y),
 from=c(0,0),to=c(1,1),sys3d="image",
varnames=c("a","b"))
curve3d(cos(2*pi*x)+sin(2*pi*y/3),
 from=c(0,0),to=c(1,1),sys3d="image")
curve3d(cos(2*pi*x)+sin(2*pi*y/3),
        sys3d="contour",add=TRUE)
par(op)



