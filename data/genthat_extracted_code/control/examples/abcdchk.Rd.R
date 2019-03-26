library(control)


### Name: abcdchk
### Title: State-space matrices check.
### Aliases: abcdchk

### ** Examples

A <- rbind(c(0,1), c(-10000,-4))
B <- rbind(0,1)
C <- rbind(c(1,0), c(0,1))
D <- rbind(0,0)
message <-  abcdchk(A,B,C,D)




