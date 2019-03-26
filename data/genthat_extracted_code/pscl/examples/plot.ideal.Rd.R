library(pscl)


### Name: plot.ideal
### Title: plots an ideal object
### Aliases: plot.ideal plot1d plot2d
### Keywords: hplot

### ** Examples

## Not run: 
##D data(s109)
##D id1 <- ideal(s109,
##D              d=1,
##D              normalize=TRUE,
##D              store.item=TRUE,
##D              maxiter=500,   ## short run for examples
##D              burnin=100,
##D              thin=10)  
##D 
##D plot(id1)
##D 
##D 
##D id2 <- ideal(s109,
##D              d=2,
##D              store.item=TRUE,
##D              maxiter=11e2,
##D              burnin=1e2,
##D              verbose=TRUE,
##D              thin=25)
##D 
##D plot(id2,overlayCuttingPlanes=TRUE)
##D 
##D id2pp <- postProcess(id2,
##D                      constraints=list(BOXER=c(-1,0),
##D                        INHOFE=c(1,0),
##D                        CHAFEE=c(0,.25)))
##D 
##D plot(id2pp,overlayCuttingPlanes=TRUE)
## End(Not run)



