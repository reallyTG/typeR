library(paleofire)


### Name: pfSimpleGrid
### Title: Produce simple gridded maps of paleofire data
### Aliases: pfSimpleGrid

### ** Examples


## Not run: 
##D ID=pfSiteSel(continent=="North America", l12==1 & long<(-130))
##D plot(ID)
##D 
##D ## Transform data
##D res3=pfTransform(ID,method=c("MinMax","Box-Cox","Z-Score"),BasePeriod=c(200,4000))
##D 
##D ## Plot maps for 1000-yr bins spanning 3-0 kBP
##D # dev.new(width=10,height=10) # A big plot area helps. 
##D gridmap = pfSimpleGrid( TR=res3, tarAge=seq(0,2000,1000), hw=500, ext=c(-170,-80,40,80))
##D summary(gridmap)
##D 
##D # Plot the mean map from the first time bin
##D newmap = update(gridmap$sg.plots[[1]], main="A relabeled map")
##D newmap
## End(Not run)




