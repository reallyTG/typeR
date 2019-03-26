library(control)


### Name: initial
### Title: Initial Condition Response for Linear Systems
### Aliases: initial initialplot

### ** Examples

res <- initial(tf(1, c(1,2,1)))
res$y
res$t
A <- rbind(c(-2, -1), c(1,0)); B <- rbind(1,0);
C <- cbind(0,1); D <- as.matrix(0);
x0 <- matrix(c( 0.51297, 0.98127))
initialplot(ss(A,B,C,D), x0)
initialplot(tf(1, c(1,2,1)), t = seq(0, 10, 0.1))

## Not run:  State-space MIMO systems 
A <- rbind(c(0,1), c(-25,-4)); B <- rbind(c(1,1), c(0,1));
C <- rbind(c(1,0), c(0,1)); D <- rbind(c(0,0), c(0,0))
res <- initial(ss(A,B,C,D))
res$y # has two rows, i.e. for two outputs
initialplot(ss(A,B,C,D))




