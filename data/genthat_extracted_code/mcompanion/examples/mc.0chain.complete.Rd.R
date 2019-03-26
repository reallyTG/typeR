library(mcompanion)


### Name: mc.0chain.complete
### Title: Extend or shrink eigenchains of 0 eigenvalues
### Aliases: mc.0chain.complete
### Keywords: mcchain internal

### ** Examples

x1 <- cbind(c(1,1), c(1,2))
j1 <- diag(c(0.8, 0.5))
m1 <- x1 %*% j1 %*% solve(x1)
bo1 <- rbind(c(0.5, 0.8), c(0.256, 0.512))

j1a <- diag(c(0, 0.5))
m1a <- x1 %*% j1a %*% solve(x1)
f1a <- cbind( rbind(m1a, bo1), 0, 0 )



