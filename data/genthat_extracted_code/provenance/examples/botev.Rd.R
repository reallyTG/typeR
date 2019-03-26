library(provenance)


### Name: botev
### Title: Compute the optimal kernel bandwidth
### Aliases: botev

### ** Examples

fname <- system.file("DZ.csv",package="provenance")
bw <- botev(read.distributional(fname)$x$N1)
print(bw)



