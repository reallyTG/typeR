library(isa2)


### Name: isa.in.silico
### Title: Generate in-silico input data for biclustering algorithms
### Aliases: isa.in.silico
### Keywords: cluster

### ** Examples

## Define a function for plotting if we are interactive
if (interactive()) { layout( rbind(1:2,3:4) ) }
myimage <- function(mat) {
  if (interactive()) { par(mar=c(1,2,2,1)); image(mat[[1]]) }
}

## Create a simple checkerboard without overlap and noise
silico1 <- isa.in.silico(100, 100, 10, mod.row.size=10, mod.col.size=10,
                         noise=0)
myimage(silico1)

## The same, but with some overlap and noise
silico2 <- isa.in.silico(100, 100, 10, mod.row.size=10, mod.col.size=10,
                         noise=0.1, overlap.row=3)
myimage(silico2)

## Modules with different noise levels
silico3 <- isa.in.silico(100, 100, 5, mod.row.size=10, mod.col.size=10,
                         noise=0.01, mod.noise=seq(0.1,by=0.1,length=5))
myimage(silico3)

## Modules with different signal levels
silico4 <- isa.in.silico(100, 100, 5, mod.row.size=10, mod.col.size=10,
                         noise=0.01, mod.signal=seq(1,5,length=5))
myimage(silico4)



