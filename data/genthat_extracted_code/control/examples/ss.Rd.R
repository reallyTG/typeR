library(control)


### Name: ss
### Title: Create State-space Model.
### Aliases: ss

### ** Examples

A <- rbind(c(-2, -1), c(1,0))
B <- rbind(1,0)
C <- cbind(0,1)
D <- 0;
sys <- ss(A,B,C,D)

## Not run:   OR 

sys <- ss(c(-2,-1,1,0), c(1,0), c(0,1), 0)

## Not run:   Access individual state-space sys elements as 

sys$A
sys$B
sys$C
sys$D




