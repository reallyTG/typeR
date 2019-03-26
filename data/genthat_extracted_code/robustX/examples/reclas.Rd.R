library(robustX)


### Name: reclas
### Title: Recursive Robust Median-like Location and Scale
### Aliases: reclas plot.reclas
### Keywords: univar robust

### ** Examples

set.seed(42)
y <- rt(10000, df = 1.5) # not quite Gaussian ...
z1 <- reclas(y)
z3 <- reclas(y, scon= 1  ) # correct fixed scale
z4 <- reclas(y, scon= 100) # wrong fixed scale
z2 <- reclas(y, # a more robust initial scale:
           scon = function(y0, m0) robustbase::Qn(y0 - m0),
           updateScale = TRUE) # still updated

## Visualizing -- using the plot() method for "reclas":
M <- median(y) ; yl <- c(-1,1)* 0.5
OP <- par(mfrow=c(2,2), mar=.1+c(3,3,1,1), mgp=c(1.5, .6, 0))
 plot(z1, M=M, ylim=yl)
 plot(z2, M=M, ylim=yl)
 plot(z3, M=M, ylim=yl)
 plot(z4, M=M, ylim=yl)
par(OP)



