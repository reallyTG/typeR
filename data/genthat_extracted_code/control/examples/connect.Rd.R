library(control)


### Name: connect
### Title: Block diagram interconnections of dynamic systems
### Aliases: connect

### ** Examples

a1 <- rbind(c(0, 0), c(1,-3))
b1 <- rbind(-2,0)
c1 <- cbind(0,-1)
d <- as.matrix(0)
a2 <- as.matrix(-5)
b2 <- as.matrix(5)
c2 <- as.matrix(1)
d2 <- as.matrix(0)
sysa1 <- ss(a1, b1, c1, d)
sysa2 <- ss(a2, b2, c2, d2)
al <- append(sysa1, sysa2)
connect(al, cbind(2,1,0), cbind(1,2), cbind(1,2))
## OR
connect(append(sysa1, sysa2), cbind(2,1,0), cbind(1), cbind(2))
 ## Not run: 
##D cbind(2,1,0) means that block 2 has an input from block 1 and block 0 (which doesnt exist)
##D cbind(1) means that block 1 is the input of the system, and cbind(2) means block 2 is the
##D output of the system.
##D if we replace cbind(2) with cbind(1,2), this means that the system has two outputs from
##D block 1 and 2
##D i.e. \code{connect(append(sysa1, sysa2), cbind(2,1,0), cbind(1), cbind(1,2))}
## End(Not run)



