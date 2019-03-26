library(adehabitatHS)


### Name: kselect
### Title: K-Select Analysis: a Method to Analyse the Habitat Selection by
###   Animals
### Aliases: kselect print.kselect hist.kselect kplot.kselect plot.kselect
###   prepksel
### Keywords: multivariate hplot

### ** Examples


## Not run: 
##D ## Load the data
##D data(puechabonsp)
##D 
##D locs <- puechabonsp$relocs
##D map <- puechabonsp$map
##D 
##D 
##D ## compute the home range of animals (e.g. using the minimum convex
##D ## polygon)
##D pc <- mcp(locs[,"Name"])
##D 
##D ## rasterize it
##D hr <- hr.rast(pc, map)
##D 
##D 
##D ## Compute the number of relocation in each pixel of the map
##D cp <- count.points(locs[,"Name"], map)
##D 
##D ## prepares the data for the kselect analysis
##D x <- prepksel(map, hr, cp)
##D tab <- x$tab
##D 
##D ## Example of analysis with two variables: the slope and the elevation.
##D ## Have a look at the use and availability of the two variables
##D ## for the 4 animals
##D tab <- tab[,((names(tab) == "Slope")|(names(tab) == "Elevation"))]
##D tab <- scale(tab)
##D tmp <- split.data.frame(tab, x$factor)
##D wg <- split(x$weight, x$factor)
##D opar <- par(mfrow = n2mfrow(nlevels(x$factor)))
##D for (i in names(tmp))
##D   s.distri(scale(tmp[[i]]), wg[[i]])
##D par(opar)
##D 
##D ## We call a new graphic window
##D x11()
##D ## A K-select analysis
##D acp <- dudi.pca(tab, scannf = FALSE, nf = 2)
##D kn <- kselect(acp, x$factor, x$weight,
##D  scannf = FALSE, nf = 2)
##D 
##D # use of the generic function scatter
##D scatter(kn)
##D 
##D # Displays the first factorial plane
##D kplot(kn)
##D kplot(kn, cellipse = 0, cpoint = 0)
##D kplot(kn, addval = FALSE, cstar = 0)
##D 
##D # this factorial plane can be compared with
##D # the other graph to see the rotation proposed by
##D # the analysis
##D graphics.off()
##D 
##D # Displays the first factorial axis
##D hist(kn)
##D 
##D # Displays the second factorial axis
##D hist(kn, xax = 2)
##D 
##D # Summary of the analysis
##D plot(kn)
## End(Not run)



