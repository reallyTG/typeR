library(SpatialExtremes)


### Name: fitcopula
### Title: Fit a copula-based model to spatial extremes
### Aliases: fitcopula
### Keywords: htest

### ** Examples

## Not run: 
##D n.site <- 30
##D n.obs <- 50
##D 
##D coord <- matrix(runif(2 * n.site, -10, 10), ncol = 2)
##D colnames(coord) <- c("lon", "lat")
##D 
##D ## Generate data from a Gaussian copula model
##D data <- rcopula(n.obs, coord, "gaussian", "powexp", nugget = 0, range = 4, smooth = 1.2)
##D 
##D ## Transform the margins to GEV
##D locs <- -5 + coord[,"lon"] / 10
##D scales <- 10 + coord[,"lat"] / 2
##D shapes <- rep(0.2, n.site)
##D 
##D for (i in 1:n.site)
##D   data[,i] <- frech2gev(data[,i], locs[i], scales[i], shapes[i])
##D 
##D ## Fit a Gaussian copula model
##D 
##D ## 1. Define trend surfaces
##D loc.form <- y ~ lon
##D scale.form <- y ~ lat
##D shape.form <- y ~ 1
##D 
##D ## 2. Fit
##D M0 <- fitcopula(data, coord, "gaussian", "powexp", loc.form, scale.form,
##D                 shape.form, nugget = 0)
## End(Not run)



