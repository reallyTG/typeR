library(mvQuad)


### Name: mvQuad-package
### Title: Methods for multivariate Quadrature (numerical integration)
### Aliases: mvQuad-package mvQuad
### Keywords: package math

### ** Examples

myGrid <- createNIGrid(dim=2, type="GLe", level=5)
rescale(myGrid, domain=rbind(c(-1,1),c(-1,1)))
print(myGrid)
plot(myGrid, col="blue")
myFun <- function(x){
   1 - x[,1]^2 * x[,2]^2
}
quadrature(myFun, myGrid)



