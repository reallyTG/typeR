library(secr)


### Name: Rsurface
### Title: Smoothed Resource Surface
### Aliases: Rsurface
### Keywords: manip

### ** Examples


## create binary covariate (0 outside habitat)
msk <- make.mask(traps(possumCH), buffer = 800)
covariates(msk) <- data.frame(z = as.numeric(pointsInPolygon
    (msk,possumarea)))

## derive and plot "resource availability"
Rs <- Rsurface(msk, sigma = 100, usecov = 'z')
plot(Rs, plottype = 'contour', col = topo.colors(10))
lines(possumarea)

## Not run: 
##D 
##D spotHeight(Rs, dec = 2)
##D 
## End(Not run)



