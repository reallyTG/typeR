library(sfsmisc)


### Name: quadrant
### Title: Give the Quadrant Number of Planar Points
### Aliases: quadrant
### Keywords: utilities

### ** Examples

xy <- as.matrix(expand.grid(x= -7:7, y= -7:7)); rownames(xy) <- NULL
(qu <- quadrant(xy))
plot(xy, col = qu+1, main = "quadrant() number", axes = FALSE)
abline(h=0, v=0, col="gray") # the x- and y- axis
text(xy, lab = qu, col = qu+1, adj = c(1.4,0))



