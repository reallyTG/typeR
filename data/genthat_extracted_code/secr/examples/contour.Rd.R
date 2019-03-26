library(secr)


### Name: contour
### Title: Contour Detection Probability
### Aliases: pdot.contour buffer.contour
### Keywords: hplot

### ** Examples


possumtraps <- traps(possumCH)

plot(possumtraps, border = 270)
pdot.contour(possumtraps, detectfn = 0, nx = 128, detectpar =
    detectpar(possum.model.0), levels = c(0.1, 0.01, 0.001),
    noccasions = 5, add = TRUE)

## convex and concave buffers
plot(possumtraps, border = 270)
buffer.contour(possumtraps, buffer = 100, add = TRUE, col = "blue")
buffer.contour(possumtraps, buffer = 100, convex = TRUE, add = TRUE)

## areas
buff.concave <- buffer.contour(possumtraps, buffer = 100,
    plt = FALSE)
buff.convex  <- buffer.contour(possumtraps, buffer = 100,
    plt = FALSE, convex = TRUE)
sum (sapply(buff.concave, polyarea)) ## sum over parts
sapply(buff.convex, polyarea)

## effect of nx on area
buff.concave2 <- buffer.contour(possumtraps, buffer = 100,
    nx = 128, plt = FALSE)
sum (sapply(buff.concave2, polyarea))

## Not run: 
##D 
##D ## clipping to polygon
##D olddir <- setwd(system.file("extdata", package = "secr"))
##D possumtraps <- traps(possumCH)
##D possumarea <- read.table("possumarea.txt", header = TRUE)
##D par(xpd = TRUE, mar = c(1,6,6,6))
##D plot(possumtraps, border = 400, gridlines = FALSE)
##D pdot.contour(possumtraps, detectfn = 0, nx = 256, detectpar =
##D     detectpar(possum.model.0), levels = c(0.1, 0.01, 0.001),
##D     noccasions = 5, add = TRUE, poly = possumarea, col = "blue")
##D lines(possumarea)
##D setwd(olddir)
##D par(xpd = FALSE, mar = c(5,4,4,2) + 0.1)    ## reset to default
##D 
## End(Not run)




