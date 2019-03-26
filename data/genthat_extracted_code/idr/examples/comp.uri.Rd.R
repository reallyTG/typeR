library(idr)


### Name: comp.uri
### Title: Compute the value of Psi and Psi' for a given t
### Aliases: comp.uri
### Keywords: internal

### ** Examples

x <- seq(1, 10, by=1)
tv <- c(0.1, 0.5)

# opposite order
y1 <- seq(10, 1, by=-1)
o1 <- order(y1)
x.o1 <- x[o1]

comp.uri(tv, x.o1)

# same order
y2 <- seq(1, 10, by=1)
o2 <- order(y2)
x.o2 <- x[o2]

comp.uri(tv, x.o2)



