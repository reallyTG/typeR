library(mvQuad)


### Name: quadrature
### Title: computes the approximated Integral
### Aliases: quadrature

### ** Examples

myGrid <- createNIGrid(dim=2, type="GLe", level=5)
rescale(myGrid, domain=rbind(c(-1,1),c(-1,1)))
plot(myGrid, col="blue")
myFun <- function(x){
   1 - x[,1]^2 * x[,2]^2
}
quadrature(myFun, myGrid)



