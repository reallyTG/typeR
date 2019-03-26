library(MLEcens)


### Name: real2canon
### Title: Transform a set of rectangles into canonical rectangles
### Aliases: real2canon
### Keywords: manip

### ** Examples

# An example with 3 arbitrarily chosen observation rectangles
R <- rbind(c(3.5, 4.2, 3.3, 9.1),   # first rectangle
           c(4.2, 4.9, 3, 4.5),     # second rectangle
           c(3.8, 5.1, 8.1, 9.5))   # third rectangle

# Plot the rectangles
par(mfrow=c(2,2))
plotRects(R, lwd=2, main="Original rectangles")

# Transform rectangles to canonical rectangles. Since the 
# boundaries of R1 and R2 coincide, it matters which boundaries
# we define to be open or closed. 

# With boundary structure c(0,1), R1 and R2 do *not* overlap:
res1 <- real2canon(R, c(0,1))    
plotRects(res1, grid=TRUE, lwd=2, main="Canonical rectangles
boundary c(0,1)")

# But with boundary structure c(1,1), R1 and R2 *do* overlap:
res2<-real2canon(R, c(1,1))
plotRects(res2, grid=TRUE, lwd=2, main="Canonical rectangles
boundary c(1,1)")



