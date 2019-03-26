library(RFLPtools)


### Name: diffDist
### Title: Distance Matrix Computation
### Aliases: diffDist
### Keywords: multivariate

### ** Examples

## assume a shift in the measured bands
M <- rbind(c(550, 500, 300, 250), c(510, 460, 260, 210),
           c(550, 500, 300, 200))
dist(M)
diffDist(M)



