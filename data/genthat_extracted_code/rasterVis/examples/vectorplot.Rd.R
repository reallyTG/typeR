library(rasterVis)


### Name: vectorplot-methods
### Title: Vector plots of Raster objects.
### Aliases: vectorplot vectorplot,Raster-method
###   vectorplot,RasterStack-method streamplot streamplot,Raster-method
###   streamplot,RasterStack-method
### Keywords: methods spatial

### ** Examples

## Not run: 
##D proj <- CRS('+proj=longlat +datum=WGS84')
##D 
##D df <- expand.grid(x=seq(-2, 2, .01), y=seq(-2, 2, .01))
##D df$z <- with(df, (3*x^2 + y)*exp(-x^2-y^2))
##D r1 <- rasterFromXYZ(df, crs=proj)
##D df$z <- with(df, x*exp(-x^2-y^2))
##D r2 <- rasterFromXYZ(df, crs=proj)
##D df$z <- with(df, y*exp(-x^2-y^2))
##D r3 <- rasterFromXYZ(df, crs=proj)
##D s <- stack(r1, r2, r3)
##D names(s) <- c('R1', 'R2', 'R3')
##D 
##D vectorplot(r1)
##D vectorplot(r2, par.settings=RdBuTheme())
##D vectorplot(r3, par.settings=PuOrTheme())
##D 
##D ## scaleSlope, aspX and aspY
##D vectorplot(r1, scaleSlope=FALSE)
##D vectorplot(r1, scaleSlope=1e-5)
##D vectorplot(r1, scaleSlope=5e-6, alpha=0.6)
##D vectorplot(r1, scaleSlope=TRUE, aspX=0.1, alpha=0.6)
##D vectorplot(r1, scaleSlope=TRUE, aspX=0.3, alpha=0.3)
##D 
##D 
##D ## Reference vector
##D # Default size (1)
##D vectorplot(r1, region = FALSE,
##D            key.arrow = list(label = 'm/s'))
##D vectorplot(r1, region = FALSE,
##D            key.arrow = list(size = 2, label = 'm/s'))
##D 
##D ## A vector field defined with horizontal and vertical components
##D u <- v <- raster(xmn=0, xmx=2, ymn=0, ymx=2, ncol=1e3, nrow=1e3)
##D x <- init(u, v='x')
##D y <- init(u, v='y')
##D u <- y * cos(x)
##D v <- y * sin(x) 
##D field <- stack(u, v)
##D names(field) <- c('u', 'v')
##D 
##D vectorplot(field, isField='dXY', narrows=5e2)
##D 
##D ## We can display both components as the background
##D vectorplot(field, isField='dXY', narrows=5e2, region=field)
##D 
##D ## It is also possible to use a RasterStack
##D ## with more than 2 layers when isField='dXY'
##D u1 <- cos(y) * cos(x)
##D v1 <- cos(y) * sin(x)
##D u2 <- sin(y) * sin(x)
##D v2 <- sin(y) * cos(x)
##D field <- stack(u, u1, u2, v, v1, v2)
##D names(field) <- c('u', 'u1', 'u2', 'v', 'v1', 'v2')
##D 
##D vectorplot(field, isField='dXY',
##D            narrows=300, lwd.arrows=.4,
##D            par.settings=BTCTheme(),
##D            layout=c(3, 1))
##D 
##D ## uLayer and vLayer define which layers contain
##D ## horizontal and vertical components, respectively
##D vectorplot(field, isField='dXY',
##D            narrows=300,
##D            uLayer=1:3,
##D            vLayer=6:4)
##D 
##D ##################################################################
##D ## Streamplot
##D ##################################################################
##D ## If no cluster is provided, streamplot uses parallel::mclapply except
##D ## with Windows. Therefore, next code could spend a long time under
##D ## Windows.
##D streamplot(r1)
##D 
##D ## With a cluster
##D hosts <- rep('localhost', 4)
##D cl <- parallel::makeCluster(hosts)
##D streamplot(r2, cl=cl,
##D            par.settings=streamTheme(symbol=brewer.pal(n=5,
##D                                                       name='Reds')))
##D parallel::stopCluster(cl)
##D 
##D ## Without parallel
##D streamplot(r3, parallel=FALSE,
##D            par.settings=streamTheme(symbol=brewer.pal(n=5,
##D                                                       name='Greens')))
##D 
##D ## Configuration of droplets and streamlets
##D streamplot(s, layout=c(1, 3), droplet=list(pc=.2), streamlet=list(L=20),
##D            par.settings=streamTheme(cex=.6))
## End(Not run)




