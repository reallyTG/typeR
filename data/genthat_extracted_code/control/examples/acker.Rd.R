library(control)


### Name: acker
### Title: Pole placement gain selection using Ackermann's formula
### Aliases: acker

### ** Examples

F <- rbind(c(0,1),c(0,0))
G <- rbind(0,1)
H <- cbind(1,0);
J <- 0
t <- 1
sys  <-  ss(F,G, H,J)
A  <-  c2d(sys,t);
j <- sqrt(as.complex(-1));
pc  <- rbind(0.78+0.18*j, 0.78-0.18*j)
K  <-  acker(A$A, A$B, pc)



