library(control)


### Name: tfdata
### Title: Retrieve Transfer function data
### Aliases: tfdata

### ** Examples

sys1 <- zpk(NULL, c(-1,-1), 1)
tfdata(sys1)
A <- rbind(c(-2, -1), c(1,0)); B <- rbind(1,0);
C <- cbind(0,1); D <- 0
tfdata( ss(A, B, C, D) )
tfdata(ss2zp( A,B,C,D))
tfdata(tf(c(1), c(1,2,1)))

 ## Not run:   MIMO system 
A = rbind(c(0,1), c(-25,-4)); B = rbind(c(1,1), c(0,1));
C = rbind(c(1,0), c(0,1)); D = rbind(c(0,0), c(0,0))
tfdata(ss(A,B,C,D))




