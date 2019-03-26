library(control)


### Name: ramp
### Title: Ramp Response for Linear Time-Invariant Systems
### Aliases: ramp rampplot

### ** Examples

res <- ramp(tf(1, c(1,2,1)))
res$y
res$t
ramp(tf(1, c(1,2,1)), seq(0, 6, 0.1))
rampplot(tf(1, c(1,2,1)))
rampplot(tf(1, c(1,2,1)), seq(0, 6, 0.1))

## Not run:  State-space MIMO systems 
A <- rbind(c(0,1), c(-25,-4)); B <- rbind(c(1,1), c(0,1));
C <- rbind(c(1,0), c(0,1)); D <- rbind(c(0,0), c(0,0))
res1 <- ramp(ss(A,B,C,D), input = 1)
res2 <- ramp(ss(A,B,C,D), input = 2)
res1$y # has two rows, i.e. for two outputs
res2$y # has two rows, i.e. for two outputs
rampplot(ss(A,B,C,D), input = 1:2) # OR
rampplot(ss(A,B,C,D), input = 1:ncol(D))
rampplot(ss(A,B,C,D), seq(0,3,0.01), 1:2)




