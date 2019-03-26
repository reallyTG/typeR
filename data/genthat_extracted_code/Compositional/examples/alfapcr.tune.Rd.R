library(Compositional)


### Name: Tuning the number of PCs in the PCR with compositional data using the alpha-transformation
### Title: Tuning the number of PCs in the PCR with compositional data
###   using the alpha-transformation
### Aliases: alfapcr.tune
### Keywords: \alpha -transformation principal components regression tuning

### ** Examples

library(MASS)
y <- as.vector(fgl[, 1])
x <- as.matrix(fgl[, 2:9])
x <- x/ rowSums(x)
mod <- alfapcr.tune(y, x, M = 10, maxk = 50, a = seq(-1, 1, by = 0.1), mat = NULL, ncores = 1)



