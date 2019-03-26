library(control)


### Name: ssdata
### Title: Retrieve State-space data
### Aliases: ssdata

### ** Examples

sys1 <- tf(c(1), c(1,2,1))
 ssdata(sys1)
 A <- rbind(c(-2, -1), c(1,0)); B <- rbind(1,0);
 C <- cbind(0,1); D <- 0;
 sys2 <- ss(A,B,C,D)
 ssdata(sys2)
 ss2zp(ssdata(zpk(NULL, c(-1,-1), 1)))




