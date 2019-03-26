library(control)


### Name: ss2tf
### Title: State-space model conversion to Transfer function model.
### Aliases: ss2tf

### ** Examples

sys2 <- tf2ss(tf(1, c(1,2,1)))
ss2tf(sys2)

## Not run:   OR 

ss2tf(sys2$A,sys2$B,sys2$C,sys2$D)

# a single input multiple output system
A <- rbind(c(0,1), c(-10000,-4)); B <- rbind(0,1); C <- rbind(c(1,0), c(0,1));
D <- rbind(0,0)
ss2tf(A, B, C, D)

# a MIMO system
A = rbind(c(0,1), c(-25,-4)); B = rbind(c(1,1), c(0,1));
C = rbind(c(1,0), c(0,1)); D = rbind(c(0,0), c(0,0))
ss2tf(A,B,C,D,1) # to obtain output for input 1
ss2tf(A,B,C,D,2) # to obtain output for input 2

## OR

systems <- vector("list", ncol(D))
for(i in 1:ncol(D)){ systems[[i]] <- ss2tf(A,B,C,D,i) }
systems
systems[[1]]
systems[[2]]




