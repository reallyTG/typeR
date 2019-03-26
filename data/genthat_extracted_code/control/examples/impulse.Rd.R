library(control)


### Name: impulse
### Title: Impulse Response for Linear Systems
### Aliases: impulse impulseplot

### ** Examples

res <- impulse(tf(1, c(1,2,1)))
res$y
res$t
impulse(tf(1, c(1,2,1)), seq(0, 10, 0.1))
impulseplot(tf(1, c(1,2,1)))
impulseplot(tf(1, c(1,2,1)), seq(0, 10, 0.1))

## Not run:  State-space MIMO systems 
A <- rbind(c(0,1), c(-25,-4)); B <- rbind(c(1,1), c(0,1));
C <- rbind(c(1,0), c(0,1)); D <- rbind(c(0,0), c(0,0))
res1 <- impulse(ss(A,B,C,D), input = 1)
res2 <- impulse(ss(A,B,C,D), input = 2)
res1$y # has two rows, i.e. for two outputs
res2$y # has two rows, i.e. for two outputs
impulseplot(ss(A,B,C,D), input = 1:2) # OR
impulseplot(ss(A,B,C,D), input = 1:ncol(D))
impulseplot(ss(A,B,C,D), seq(0,3,0.01), 1:2)




