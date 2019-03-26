library(multigroup)


### Name: loadingsplotXY
### Title: loadings plot of X and Y
### Aliases: loadingsplotXY

### ** Examples

data(oliveoil)
DataX = oliveoil[,2:6]
DataY = oliveoil[,7:12]
Group = as.factor(oliveoil[,1])
res.mgPLS = mgPLS (DataX, DataY, Group)
X=res.mgPLS$loadings.commo$X; Y=res.mgPLS$loadings.commo$Y
loadingsplotXY(X, Y, axes=c(1,2), INERTIE=res.mgPLS$noncumper.inertiglobal)



