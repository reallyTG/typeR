library(jointseg)


### Name: anotherBkp
### Title: Get best candidate change point
### Aliases: anotherBkp
### Keywords: internal

### ** Examples


p <- 2
n <- 100

sim <- randomProfile(n, 1, 1, p)
Y <- sim$profile
bkp <- anotherBkp(Y)
print(bkp)
print(oneBkp(Y))
##  stopifnot(identical(oneBkp(Y), bkp))
plotSeg(Y, list(sim$bkp, bkp))

## robustness to NA:s
h <- 2
idxs <- seq(from=max(sim$bkp[1]-h, 1), min(sim$bkp[1]+h, n))
Y[idxs, p] <- NA
oneBkp(Y)  ## does not work
bkp <- anotherBkp(Y)  ## works
bkp-sim$bkp




