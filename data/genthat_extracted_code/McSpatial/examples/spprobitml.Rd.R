library(McSpatial)


### Name: spprobitml 
### Title: Maximum Likelihood Estimation of a Spatial Probit Model
### Aliases: 'spprobitml '
### Keywords: Spatial AR Model Parametric Models Discrete Choice Models

### ** Examples

set.seed(9947)
cmap <- readShapePoly(system.file("maps/CookCensusTracts.shp",
  package="McSpatial"))
cmap <- cmap[cmap$CHICAGO==1&cmap$CAREA!="O'Hare",]
lmat <- coordinates(cmap)
dnorth <- geodistance(lmat[,1],lmat[,2], lotarget=-87.627800, 
	latarget=41.881998,dcoor=TRUE)$dnorth
cmap <- cmap[dnorth>1,]
wmat <- makew(cmap)$wmat
n = nrow(wmat)
rho = .4
x <- runif(n,0,10)
ystar <- as.numeric(solve(diag(n) - rho*wmat)%*%(x + rnorm(n,0,2)))
y <- ystar>quantile(ystar,.4)
fit <- spprobitml(y~x,  wmat=wmat)




