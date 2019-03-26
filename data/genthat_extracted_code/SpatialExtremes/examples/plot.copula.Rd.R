library(SpatialExtremes)


### Name: plot.copula
### Title: Model checking of a fitted copula based model.
### Aliases: plot.copula
### Keywords: hplot

### ** Examples

## Not run: 
##D n.site <- 20
##D n.obs <- 50
##D coord <- matrix(runif(2 * n.site, 0, 10), ncol = 2)
##D colnames(coord) <- c("lon", "lat")
##D data <- rmaxstab(n.obs, coord, "powexp", nugget = 0, range = 3, smooth =
##D 1)
##D fitted <- fitcopula(log(data), coord, "student", "powexp", y ~ 1, y ~ 1, y ~ 1,
##D nugget = 0)
##D plot(fitted)
## End(Not run)



