library(McSpatial)


### Name: gmmprobit 
### Title: GMM Spatial Probit
### Aliases: 'gmmprobit '
### Keywords: Parmametric Models Spatial AR Model Discrete Choice Models

### ** Examples

set.seed(9947)
cmap <- readShapePoly(system.file("maps/CookCensusTracts.shp",
  package="McSpatial"))
cmap <- cmap[cmap$CHICAGO==1&cmap$CAREA!="O'Hare",]
lmat <- coordinates(cmap)
dnorth <- geodistance(lmat[,1],lmat[,2], -87.627800, 
	41.881998, dcoor=TRUE)$dnorth
cmap <- cmap[dnorth>0,]
wmat <- makew(cmap)$wmat
n = nrow(wmat)
rho = .4
x <- runif(n,0,10)
ystar <- as.numeric(solve(diag(n) - rho*wmat)%*%(x + rnorm(n,0,2)))
y <- ystar>quantile(ystar,.4)
fit <- gmmprobit(y~x,  wmat=wmat)



