library(ade4)


### Name: pcoscaled
### Title: Simplified Analysis in Principal Coordinates
### Aliases: pcoscaled
### Keywords: array

### ** Examples

    a <- 1 / sqrt(3) - 0.2
    w <- matrix(c(0,0.8,0.8,a,0.8,0,0.8,a,
        0.8,0.8,0,a,a,a,a,0),4,4)
    w <- as.dist(w)
    w <- cailliez(w)
    w
    pcoscaled(w)
    dist(pcoscaled(w)) # w
    dist(pcoscaled(2 * w)) # the same
    sum(pcoscaled(w)^2) # unity



