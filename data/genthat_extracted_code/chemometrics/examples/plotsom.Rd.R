library(chemometrics)


### Name: plotsom
### Title: Plot SOM results
### Aliases: plotsom
### Keywords: multivariate robust

### ** Examples

data(glass)
require(som)
Xs <- scale(glass)
Xn <- Xs/sqrt(apply(Xs^2,1,sum))
X_SOM <- som(Xn,xdim=4,ydim=4) # 4x4 fields
data(glass.grp)
res <- plotsom(X_SOM,glass.grp,type="bar")



