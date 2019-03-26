library(paleofire)


### Name: pfDotMap
### Title: Produce maps of paleofire data
### Aliases: pfDotMap

### ** Examples


## Not run: 
##D ## Composite charcoal record for North America:
##D ID=pfSiteSel(continent=="North America", long<(-100),l12==1 & long<(-130))
##D plot(ID)
##D 
##D ## Transform data
##D res3=pfTransform(ID,method=c("MinMax","Box-Cox","Z-Score"),BasePeriod=c(200,4000))
##D 
##D ## Plot maps for 1000-yr bins spanning 3-0 kBP
##D # dev.new(width=10,height=10) # A big plot area helps. 
##D dotmap = pfDotMap( TR=res3, tarAge=seq(0,2000,1000), hw=500, grd.ext=c(-170,-80,40,80), 
##D                    cx.minsize=2,cx.mult=3)
##D summary(dotmap)
##D 
##D # Plot the mean map from the first time bin
##D # newmap = update(dotmap$plots[[1]]$mean, main="A relabeled map")
##D # newmap
## End(Not run)




