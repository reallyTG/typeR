library(SpatialPosition)


### Name: mcStewart
### Title: Stewart Potentials Parallel
### Aliases: mcStewart

### ** Examples

## Not run: 
##D if(require(cartography)){
##D   nuts3.spdf@data <- nuts3.df
##D   t1 <- system.time(
##D     s1 <- stewart(knownpts = nuts3.spdf,resolution = 40000, 
##D                   varname = "pop2008",
##D                   typefct = "exponential", span = 100000,
##D                   beta = 3, mask = nuts3.spdf)
##D   )
##D   
##D   t2 <- system.time(
##D     s2 <- mcStewart(knownpts = nuts3.spdf, resolution = 40000, 
##D                      varname = "pop2008",
##D                      typefct = "exponential", span = 100000,
##D                      beta = 3, mask = nuts3.spdf, cl = 3, size = 500)
##D   )
##D   identical(s1, s2)
##D   cat("Elapsed time\n", "stewart:", t1[3], "\n parStewart:",t2[3])
##D   
##D   r2 <- rasterStewart(s2)
##D   c2 <- rasterToContourPoly(r = r2, breaks = c(0,1000000,2000000, 5000000,
##D                                                10000000, 20000000, 200004342), 
##D                             mask = nuts3.spdf)
##D   # cartography
##D   opar <- par(mar = c(0,0,1.2,0))
##D   bks <- sort(unique(c(c2$min, c2$max)))
##D   choroLayer(spdf = c2, var = "center", breaks = bks, border = NA, 
##D              legend.title.txt = "pop")
##D   layoutLayer("potential population", "","", scale = NULL)
##D   par(opar)
##D }
## End(Not run)



