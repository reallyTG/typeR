library(agridat)


### Name: holland.arthropods
### Title: Counts of arthropods in a grid-sampled wheat field
### Aliases: holland.arthropods
### Keywords: datasets

### ** Examples


data(holland.arthropods)
dat <- holland.arthropods


# use log count to make it possible to have same scale for insects
if(require(reshape2) & require(lattice)){
  grays <- colorRampPalette(c("#d9d9d9","#252525"))
  dat2 <- melt(dat, id.var=c('row','col'))
  contourplot(log(value) ~ col*row|variable, dat2,
              col.regions=grays(7), region=TRUE,
              main="holland.arthropods - log counts in winter wheat")
}


## Not run: 
##D   # individual species
##D   require(lattice)
##D   grays <- colorRampPalette(c("#d9d9d9","#252525"))
##D   contourplot(linyphiidae ~ col*row, dat, at=c(0,40,80,120,160,200), region=TRUE,
##D               col.regions=grays(5),
##D               main="holland.arthropods - linyphiidae counts in winter wheat")
##D   contourplot(n.brevicollis ~ col*row, dat, region=TRUE)
##D   contourplot(linyphiidae~ col*row, dat, region=TRUE)
##D   contourplot(collembola ~ col*row, dat, region=TRUE)
##D   contourplot(carabidae ~ col*row, dat, region=TRUE)
##D   contourplot(lycosidae ~ col*row, dat, region=TRUE)
##D   contourplot(weedcover ~ col*row, dat, region=TRUE)
## End(Not run)




