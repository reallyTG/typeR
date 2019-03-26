library(MLEcens)


### Name: canon2real
### Title: Transform (intersections of) canonical rectangles back to their
###   original coordinates
### Aliases: canon2real
### Keywords: manip

### ** Examples

# An example with 3 arbitrarily chosen observation rectangles
R <- rbind(c(3.5, 4.2, 3.3, 9.1),    # first rectangle
           c(4.2, 4.9, 3, 4.5),      # second rectangle
           c(3.8, 5.1, 8.1, 9.5))    # third rectangle

# Plot the rectangles
par(mfrow=c(2,2))
plotRects(R, lwd=2, main="Original rectangles")

# Transform rectangles into canonical rectangles
res1 <- real2canon(R, c(0,1))   
plotRects(res1, grid=TRUE, lwd=2, main="Canonical rectangles")

# Transform canonical rectangles back to original coordinates   
res2 <- canon2real(res1, R, c(0,1))
plotRects(res2$rects, lwd=2, main="Original rectangles")
   
# Only transform rectangle (2,3)x(4,5), which is the  
# the intersection of the canonical rectangles R1 and R3. 
# The result is the intersection of the original rectangles R1 and R3. 
R.1.3 <- matrix(c(2,3,4,5),nrow=1)
res3 <- canon2real(R.1.3, R, c(0,1))
res3$rects
 
# Note that the algorithm keeps track of the boundaries of the rectangles:
B <- rbind(c(1,0,1,0),
           c(1,1,1,1),
           c(0,1,0,1))
res4 <- canon2real(R.1.3, R, B)
res4$bounds    



