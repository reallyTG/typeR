library(secr)


### Name: snip
### Title: Slice Transect Into Shorter Sections
### Aliases: snip
### Keywords: manip

### ** Examples


x <- seq(0, 4*pi, length = 41)
temptrans <- make.transect(x = x*100, y = sin(x)*300)
plot (snip(temptrans, by = 200), markvertices = 1)

## Not run: 
##D 
##D ## simulate some captures
##D tempcapt <- sim.capthist(temptrans, popn = list(D = 2,
##D    buffer = 300), detectpar = list(g0 = 0.5, sigma = 50),
##D    binomN = 0)
##D 
##D ## snip capture histories
##D tempCH <- snip(tempcapt, by = 20)
##D 
##D ## collapse from 'transect' to 'count', discarding location within transects
##D tempCH <- reduce(tempCH, outputdetector = "count")
##D 
##D ## fit secr model and examine H-T estimates of density
##D derived(secr.fit(tempCH, buffer = 300, CL = TRUE, trace = FALSE))
##D 
##D ## also, may split an existing transect into equal lengths
##D ## same result:
##D plot(snip(temptrans, by = transectlength(temptrans)/10),
##D     markvertices = 1)
##D plot(snip(temptrans, length.out = 10), markvertices = 1)
##D 
## End(Not run)




