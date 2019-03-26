library(control)


### Name: step
### Title: Step Response for Linear Systems
### Aliases: step stepplot

### ** Examples

res <- step(tf(1, c(1,2,1)))
res$y
res$t
step(tf(1, c(1,2,1)), seq(0, 10, 0.1))
stepplot(tf(1, c(1,2,1)))
stepplot(tf(1, c(1,2,1)), seq(0, 10, 0.1))

## Not run:   State-space MIMO systems 

A <- rbind(c(0,1), c(-25,-4)); B <- rbind(c(1,1), c(0,1));
C <- rbind(c(1,0), c(0,1)); D <- rbind(c(0,0), c(0,0))
res1 <- step(ss(A,B,C,D), input = 1)
res2 <- step(ss(A,B,C,D), input = 2)
res1$y # has two rows, i.e. for two outputs
res2$y # has two rows, i.e. for two outputs
stepplot(ss(A,B,C,D), input = 1:2) # OR
stepplot(ss(A,B,C,D), input = 1:ncol(D))




