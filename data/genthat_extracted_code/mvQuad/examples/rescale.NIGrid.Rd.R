library(mvQuad)


### Name: rescale (rescale.NIGrid)
### Title: moves, rescales and/or rotates a multidimensional grid.
### Aliases: rescale 'rescale (rescale.NIGrid)' rescale.NIGrid

### ** Examples

C = matrix(c(2,0.9,0.9,2),2)
m = c(-.5, .3)
par(mfrow=c(3,1))

myGrid <- createNIGrid(dim=2, type="GHe", level=5)

rescale(myGrid, m=m, C=C, dec.type=0)
plot(myGrid, col="red")

rescale(myGrid, m=m, C=C, dec.type=1)
plot(myGrid, col="green")

rescale(myGrid, m=m, C=C, dec.type=2)
plot(myGrid, col="blue")



