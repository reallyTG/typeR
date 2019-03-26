library(orthoDr)


### Name: distance
### Title: distance correlation
### Aliases: distance

### ** Examples

# two spaces
failEDR = as.matrix(cbind(c(1, 1, 0, 0, 0, 0),
                          c(0, 0, 1, -1, 0, 0)))
B = as.matrix(cbind(c(0.1, 1.1, 0, 0, 0, 0),
                    c(0, 0, 1.1, -0.9, 0, 0)))

distance(failEDR, B, "dist")
distance(failEDR, B, "trace")

N=300
P=6
dataX = matrix(rnorm(N*P), N, P)
distance(failEDR, B, "canonical", dataX)



