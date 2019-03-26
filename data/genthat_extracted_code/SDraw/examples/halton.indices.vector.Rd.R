library(SDraw)


### Name: halton.indices.vector
### Title: Halton indices for an entire vector of coordinates
### Aliases: halton.indices.vector

### ** Examples

# Compute Halton box index for one value
pt <- data.frame(x=0.43, y=0.64)
n.boxes <- c(16,9) 
halton.indices.vector(pt, n.boxes) # should equal 70

pt <- data.frame(x=143, y=164)
halton.indices.vector(pt, n.boxes, delta=c(100,100), ll.corner=c(100,100)) # should also equal 70

# Plot Halton boxes and indices to check
b <- c(2,3)
J <- c(4,2)  # or, J <- log(n.boxes) / log(b) # = (log base 2 of 16, log base 3 of 9)
hl.ind <- halton( prod(n.boxes), 2,0 )
plot(c(0,1),c(0,1),type="n")
for( i in J[1]:1) abline(v=(0:b[1]^i)/b[1]^i, lwd=J[1]+1-i, col=i)
for( i in J[2]:1) abline(h=(0:b[2]^i)/b[2]^i, lwd=J[2]+1-i, col=i)
for( i in 1:prod(n.boxes)){
  box.center <- (floor(n.boxes*hl.ind[i,]+.Machine$double.eps*10) + 1-.5)/n.boxes
  text(box.center[1],box.center[2], i-1, adj=.5)  
}
points(pt$x, pt$y, col=6, pch=16, cex=2)





