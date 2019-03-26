library(adehabitatHR)


### Name: mcp
### Title: Estimation of the Home Range Using the Minimum Convex Polygon
###   Estimator
### Aliases: mcp hr.rast plot.hrsize mcp.area
### Keywords: hplot spatial

### ** Examples


data(puechabonsp)
rel <-  puechabonsp$relocs


## estimates the MCP
cp <- mcp(rel[,1])

## The home-range size
as.data.frame(cp)

## Plot the home ranges
plot(cp)

## ... And the relocations
plot(rel, col=as.data.frame(rel)[,1], add=TRUE)


## Computation of the home-range size:
cuicui1 <- mcp.area(rel[,1])

## Rasterization
ii <- hr.rast(cp, puechabonsp$map)

opar <- par(mfrow=c(2,2))
lapply(1:4, function(i) {image(ii, i); box()})
par(opar)





