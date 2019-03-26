library(control)


### Name: zpkdata
### Title: Retrieve zero-pole data from LTI system object
### Aliases: zpkdata

### ** Examples


sys1 <- zpk(NULL, c(-1,-1), 1)
zpkdata(sys1)
sys3 <- tf(c(1), c(1,2,1))
zpkdata(sys3)

## Not run:   MIMO system of 2-inputs and 2-outputs 
A = rbind(c(0,1), c(-25,-4)); B = rbind(c(1,1), c(0,1));
C = rbind(c(1,0), c(0,1)); D = rbind(c(0,0), c(0,0))
zpkdata(ss(A,B,C,D))

## OR
syszp <- zpkdata(ss(A,B,C,D))
syszp[[1]]
syszp[[2]]
syszp[[1]]$z # retrieve zeros of system 1 - Input 1 to Outputs 1 and 2
syszp[[2]]$z # retrieve zeros of system 2 - Input 2 to Outputs 1 and 2




