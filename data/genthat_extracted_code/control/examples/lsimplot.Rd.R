library(control)


### Name: lsimplot
### Title: Plot time response of an LTI system
### Aliases: lsimplot

### ** Examples

signal <- gensig('square',4,10,0.1)
H <- tf(c(2, 5, 1),c(1, 2, 3))
lsimplot(H, signal$u, signal$t)

## Not run:  MIMO system response 
A <- rbind(c(0,1), c(-25,-4)); B <- rbind(c(1,1), c(0,1))
C <- rbind(c(1,0), c(0,1)); D <- rbind(c(0,0), c(0,0))
lsimplot(ss(A,B,C,D), cbind(signal$u, signal$u), signal$t)




