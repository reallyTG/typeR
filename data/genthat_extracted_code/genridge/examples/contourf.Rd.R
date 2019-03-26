library(genridge)


### Name: contourf
### Title: Enhanced Contour Plots
### Aliases: contourf
### Keywords: hplot

### ** Examples

x <- 10*1:nrow(volcano)
y <- 10*1:ncol(volcano)
contourf(x,y,volcano, col="blue")
contourf(x,y,volcano, col="blue", nlevels=6)

# return value, unfilled, other graphic parameters
res <- contourf(x,y,volcano, col="blue", fill.col=NULL, lwd=2)
# levels used in the plot
sapply(res, function(x) x[[1]])




