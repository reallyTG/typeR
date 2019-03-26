library(nat)


### Name: seglengths
### Title: Calculate length of all segments in neuron
### Aliases: seglengths

### ** Examples

summary(seglengths(Cell07PNs[[1]]))
hist(unlist(seglengths(Cell07PNs[[1]], sumsegment = FALSE)),
  br=20, main='histogram of edge lengths', xlab='edge lengths /microns')



