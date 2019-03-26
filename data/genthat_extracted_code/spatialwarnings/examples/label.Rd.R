library(spatialwarnings)


### Name: label
### Title: Labelling of unique patches and detection of percolation.
### Aliases: label percolation

### ** Examples


data(forestgap)

par(mfrow=c(1, 2))
rmat <- matrix(rnorm(100) > .1, ncol = 10)
image(rmat)
image(label(rmat))

# With 8-way neighborhood mask and no wrapping around borders
nbmask8 <- matrix(c(1,1,1,
                    1,0,1,
                    1,1,1), ncol=3)
image(label(rmat, nbmask8, wrap = FALSE))




