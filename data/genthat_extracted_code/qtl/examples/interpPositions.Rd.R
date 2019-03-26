library(qtl)


### Name: interpPositions
### Title: Interpolate positions from one map to another
### Aliases: interpPositions
### Keywords: manip

### ** Examples

data(hyper)

# hyper genetic map
gmap <- pull.map(hyper)

# a fake physical map, with each chromosome starting at 0.
pmap <- shiftmap(rescalemap(gmap, 2))

# positions on pmap to determine location on gmap
tofind <- data.frame(chr=c(1, 5, 17, "X"), pos=c(220, 20, 105, 10))
rownames(tofind) <- paste("loc", 1:nrow(tofind), sep="")

interpPositions(tofind, pmap, gmap)



