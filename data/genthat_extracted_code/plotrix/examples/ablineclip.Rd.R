library(plotrix)


### Name: ablineclip
### Title: Add a straight line to a plot
### Aliases: ablineclip
### Keywords: aplot

### ** Examples

 x <- rnorm(100)
 y <- x + rnorm(100)
 lmfit <- lm(y~x)
 plot(x, y, xlim=c(-3.5, 3.5))
 ablineclip(lmfit, x1 = -2, x2 = 2, lty = 2)
 ablineclip(h = 0, x1 = -2,x2 = 2,lty = 3, col = "red")
 ablineclip(v = 0, y1 = -2.5, y2 = 1.5, lty=4, col = "green")



