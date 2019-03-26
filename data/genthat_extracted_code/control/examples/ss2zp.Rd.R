library(control)


### Name: ss2zp
### Title: State-space representation to zero-pole-gain representation
### Aliases: ss2zp

### ** Examples

A <- rbind(c(-2, -1), c(1,0)); B <- rbind(1,0);
C <- cbind(0,1); D <- 0;
sys2 <- ss(A,B,C,D)
ss2zp(sys2$A,sys2$B,sys2$C,sys2$D)
ss2zp( zp2ss ( tf2zp( c(1,1,1), c(1,2,1) ) ) )

## Not run:   A MIMO system 
A = rbind(c(0,1), c(-25,-4)); B = rbind(c(1,1), c(0,1));
C = rbind(c(1,0), c(0,1)); D = rbind(c(0,0), c(0,0))
ss2tf(A,B,C,D,1) # to obtain output for input 1
ss2tf(A,B,C,D,2) # to obtain output for input 2

## Not run:   OR 

systems <- vector("list", ncol(D))
for(i in 1:ncol(D)){ systems[[i]] <- ss2zp(A,B,C,D,i) }
systems
systems[[1]]
systems[[2]]




