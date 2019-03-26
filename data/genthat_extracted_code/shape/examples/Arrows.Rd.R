library(shape)


### Name: Arrows
### Title: adds arrows with improved arrowhead to a plot
### Aliases: Arrows
### Keywords: aplot

### ** Examples

xlim <- c(-5 , 5)
ylim <- c(-10, 10)
plot(0, type = "n", xlim = xlim, ylim = ylim, 
     main = "Arrows,  type = 'curved'")
x0 <- runif(100, xlim[1], xlim[2])
y0 <- runif(100, ylim[1], ylim[2])
x1 <- x0+runif(100, -1, 1)
y1 <- y0+runif(100, -1, 1)
Arrows(x0, y0, x1, y1, arr.length = runif(100), code = 2, 
       arr.type = "curved", arr.col = 1:100, lcol = 1:100)
  
plot(0, type = "n", xlim = xlim, ylim = ylim, 
     main = "Arrows,  type = 'circle'")
x0 <- runif(100, xlim[1], xlim[2])
y0 <- runif(100, ylim[1], ylim[2])
x1 <- x0 + runif(100, -1, 1)
y1 <- y0 + runif(100, -1, 1)
Arrows(x0, y0, x1, y1, arr.length = 0.2, code = 3, 
       arr.type = "circle", arr.col = "grey")
  
plot(0, type = "n", xlim = xlim, ylim = ylim, 
     main = "Arrows,  type = 'ellipse'")
Arrows(x0, y0, x1, y1, arr.length = 0.2, arr.width = 0.5, 
       code = 3, arr.type = "ellipse",  arr.col = "grey")

curve(expr = sin(x), 0, 2*pi+0.25, main = "Arrows")
x  <- seq(0, 2*pi, length.out = 10)
xd <- x + 0.025
Arrows(x, sin(x), xd, sin(xd), type = "triangle", 
       arr.length = 0.5, segment = FALSE)
  
xx <- seq(0, 10*pi, length.out = 1000)
plot(sin(xx)*xx, cos(xx)*xx, type = "l", axes = FALSE, 
     xlab = "", ylab = "", main = "Arrows,  type = 'curved'")
x  <- seq(0, 10*pi, length.out = 20)
x1 <- sin(x)*x
y1 <- cos(x)*x
xd <- x+0.01
x2 <- sin(xd)*xd
y2 <- cos(xd)*xd
Arrows(x1, y1, x2, y2, arr.type = "curved", arr.length = 0.4, 
       segment = FALSE, code = 1, arr.adj = 0.5 )

plot(sin(xx)*xx, cos(xx)*xx, type = "l", axes = FALSE, 
     xlab = "", ylab = "", main = "Arrows,  type = 'T'")
Arrows(x1, y1, x2, y2, arr.type = "T", arr.length = 0.4, 
       code = 1, arr.lwd = 2)


# arguments passed to polygon:

xlim <- c(-5 , 5)
ylim <- c(-10, 10)
plot(0, type = "n", xlim = xlim, ylim = ylim, 
     main = "Arrows,  type = 'curved'")
x0 <- runif(100, xlim[1]-1, xlim[2]+0.5)  # exceeds the x-range
y0 <- runif(100, ylim[1], ylim[2])
x1 <- x0+runif(100, -1, 1)
y1 <- y0+runif(100, -1, 1)
Arrows(x0, y0, x1, y1, arr.length = runif(100), code = 2, 
       arr.type = "curved", arr.col = 1:100, lcol = 1:100, xpd = TRUE)





