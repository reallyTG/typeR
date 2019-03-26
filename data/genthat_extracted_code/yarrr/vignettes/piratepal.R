## ---- echo = F, message = F, results = 'hide'----------------------------
library("yarrr")

## ---- fig.width = 6, fig.height = 6, fig.align='center'------------------
piratepal(palette = "all")

## ------------------------------------------------------------------------
piratepal(palette = "google")

## ---- fig.width = 6, fig.height = 6, fig.align='center'------------------
piratepal(palette = "southpark", 
          trans = .5,
          plot.result = T)

## ----echo = F------------------------------------------------------------
set.seed(105)

## ---- fig.width = 6, fig.height = 6, fig.align='center'------------------
piratepal("random", plot.result = T)

## ---- fig.width = 6, fig.height = 6, fig.align='center'------------------
piratepal(palette = "evildead",
          trans = .5,
          plot.result = T)

## ---- fig.width = 6, fig.height = 6, fig.align = 'center'----------------
xmen.cols <- piratepal(palette = "xmen",  
                     trans = .5)

x <- rnorm(100)
y <- x + rnorm(100)

plot(x = x, y = y, 
     col =  xmen.cols,
     pch = 16,
     cex = 2,
     main = "piratepal('xmen', trans = .5)")

## ---- fig.width = 8, fig.height = 6, fig.align='center', results='hold'----
# Set up balloons
balloon.colors <- piratepal("basel", trans = .2)
balloon.x <- rnorm(500, 0)
balloon.y <- rnorm(500, 4, 1)

par(mar = rep(.1, 4))
plot(1, xlim = c(-15, 7), ylim = c(-15, 7),
    xlab = "", ylab = "", type = "n", 
    xaxt = "n", yaxt = "n", bty = "n")

# skyline
start.x <- runif(200, -15, 7)
start.y <- sort(runif(200, -15, -12), decreasing = T)
heights <- runif(200, 2, 4)
widths <- runif(200, .25, 1.5)
  
rect(start.x, start.y, start.x + widths, start.y + heights, 
     col = "white", border = gray(.4))

# house
rect(-2, -6, 2, -2)
polygon(c(-2, 0, 2),
        c(-2, 0, -2))
rect(-.5, -6, .5, -4)
points(.3, -5)

# strings
line.start.x <- rnorm(500, 0, .2)
line.start.y <- -1 + rnorm(500, 0, .1)
segments(line.start.x, 
         line.start.y, 
         balloon.x, balloon.y, 
         lty = 1, col = gray(.5, .1), lwd = .2)

# balloons
points(balloon.x, balloon.y, pch = 21, 
       bg = balloon.colors,
       col = gray(.9), cex = rnorm(100, 2, .3))

## ---- echo = F-----------------------------------------------------------
par(mar = c(5, 4, 4, 1) + .1)

