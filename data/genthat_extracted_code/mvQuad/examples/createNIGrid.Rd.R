library(mvQuad)


### Name: createNIGrid
### Title: creates a grid for numerical integration.
### Aliases: createNIGrid

### ** Examples

## 1D-Grid --> closed Newton-Cotes Formula of degree 1 (trapeziodal-rule)
myGrid <- createNIGrid(dim=1, type="cNC1", level=10)
print(myGrid)
## 2D-Grid --> nested Gauss-Legendre rule
myGrid <- createNIGrid(dim=2, type=c("GLe","nLe"), level=c(4, 7))
rescale(myGrid, domain = rbind(c(-1,1),c(-1,1)))
plot(myGrid)
print(myGrid)
myFun <- function(x){
   1-x[,1]^2*x[,2]^2
}
quadrature(f = myFun, grid = myGrid)
## level transformation
levelTrans <- function(x){
  tmp <- as.matrix(x)
  tmp[, 2] <- 2*tmp[ ,2]
  return(tmp)
}
nw <- createNIGrid(dim=2, type="cNC1", level = 3,
   level.trans = levelTrans, ndConstruction = "sparse")
plot(nw)



