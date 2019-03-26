library(isa2)


### Name: ppa.in.silico
### Title: Generate in-silico input data for testing the PPA algorithm
### Aliases: ppa.in.silico
### Keywords: cluster

### ** Examples

## Define a function for plotting if we are interactive
if (interactive()) { layout(cbind(1:2,3:4,5:6,7:8)) }
myimage <- function(mat) {
  if (interactive()) {
    par(mar=c(3,2,1,1)); image(mat[[1]])
    par(mar=c(3,2,1,1)); image(mat[[2]])
  }
}

## Co-modules without overlap and noise
silico1 <- ppa.in.silico(100, 100, 100, 10, mod.row1.size=10,
                         mod.row2.size=10, mod.col.size=10, noise=0)
myimage(silico1)

## The same, but with overlap and noise
silico2 <- ppa.in.silico(100, 100, 100, 10, mod.row1.size=10,
                         mod.row2.size=10, mod.col.size=10, noise=0.1,
                         overlap.row1=3)
myimage(silico2)

## Co-modules with different noise levels
silico3 <- ppa.in.silico(100, 100, 100, 5, mod.row1.size=10,
                         mod.row2.size=10, mod.col.size=10, noise=0.01,
                         mod.noise=seq(0.1,by=0.1,length=5))
myimage(silico3)

## Co-modules withe different signal levels
silico4 <- ppa.in.silico(100, 100, 100, 5, mod.row1.size=10,
                         mod.row2.size=10, mod.col.size=10, noise=0.01,
                         mod.signal=seq(1,5,length=5))
myimage(silico4)



