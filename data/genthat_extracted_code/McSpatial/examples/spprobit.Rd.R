library(McSpatial)


### Name: spprobit 
### Title: Linearized GMM spatial probit
### Aliases: 'spprobit '
### Keywords: Spatial AR Model Parametric Models Discrete Choice Models

### ** Examples

set.seed(9947)
cmap <- readShapePoly(system.file("maps/CookCensusTracts.shp",
  package="McSpatial"))
cmap <- cmap[cmap$CHICAGO==1&cmap$CAREA!="O'Hare",]
wmat <- makew(cmap)$wmat
n = nrow(wmat)
rho = .4
x <- runif(n,0,10)
ystar <- as.numeric(solve(diag(n) - rho*wmat)%*%(x + rnorm(n,0,2)))
y <- ystar>quantile(ystar,.4)
fit <- spprobit(y~x,  wmat=wmat)



