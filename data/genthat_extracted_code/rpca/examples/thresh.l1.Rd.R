library(rpca)


### Name: thresh.l1
### Title: Shrinkage operator
### Aliases: thresh.l1
### Keywords: shrinkage operator

### ** Examples

## The function is currently defined as
function(x,thr){sign(x)*pmax(abs(x)-thr,0)}

summary(thresh.l1(runif(100),0.3))



